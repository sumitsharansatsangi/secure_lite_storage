import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path_provider/path_provider.dart';
import 'package:secure_lite_storage/generated/storage.pb.dart';
import 'package:path/path.dart' as path;

class SecureLiteStorageIsolate {
  static final SecureLiteStorageIsolate _instance =
      SecureLiteStorageIsolate._internal();
  factory SecureLiteStorageIsolate() => _instance;
  SecureLiteStorageIsolate._internal();
  late final encrypt.Key _key;
  late final encrypt.IV _iv;

  KeyValueList _keyValueList = KeyValueList();
  late File _file;
  late encrypt.Encrypter _encrypter;

  Future<void> init() async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true, resetOnError: true);
    final FlutterSecureStorage secureStorage =
        FlutterSecureStorage(aOptions: getAndroidOptions());
    if (await secureStorage.containsKey(key: 'ss') &&
        await secureStorage.containsKey(key: 'sv')) {
      final encryptedSSData = await secureStorage.read(key: 'ss');
      final encrypteSVData = await secureStorage.read(key: 'sv');
      if (encryptedSSData == null || encrypteSVData == null) {
        _key = encrypt.Key.fromLength(32);
        _iv = encrypt.IV.fromLength(16);
        await secureStorage.write(key: 'ss', value: _key.base64);
        await secureStorage.write(key: 'sv', value: _iv.base64);
      } else {
        _key = encrypt.Key.fromBase64(encryptedSSData);
        _iv = encrypt.IV.fromBase64(encrypteSVData);
      }
    } else {
      _key = encrypt.Key.fromLength(32);
      _iv = encrypt.IV.fromLength(16);
      await secureStorage.write(key: 'ss', value: _key.base64);
      await secureStorage.write(key: 'sv', value: _iv.base64);
    }

    _encrypter =
        encrypt.Encrypter(encrypt.AES(_key, mode: encrypt.AESMode.cbc));
    final directory = await getApplicationDocumentsDirectory();
    _file = File(path.join(directory.path, 'storage2.sls'));
    if (await _file.exists()) {
      final bytes = await _file.readAsBytes();
      if (bytes.isNotEmpty) {
        final decrypted =
            _encrypter.decryptBytes(encrypt.Encrypted(bytes), iv: _iv);
        _keyValueList = KeyValueList.fromBuffer(decrypted);
      }
    }
  }

  Future<T>? get<T>(String key) async {
    return await Isolate.run<T>(() => _get(key));
  }

  T? _get<T>(String key) {
    for (final kv in _keyValueList.data) {
      if (kv.key == key) {
        switch (kv.value.whichKind()) {
          case Value_Kind.stringValue:
            return kv.value.stringValue as T;
          case Value_Kind.intValue:
            return kv.value.intValue as T;
          case Value_Kind.doubleValue:
            return kv.value.doubleValue as T;
          case Value_Kind.boolValue:
            return kv.value.boolValue as T;
          case Value_Kind.bytesValue:
            return kv.value.bytesValue as T;
          case Value_Kind.listStringValue:
            return kv.value.listStringValue.values as T;
          case Value_Kind.listIntValue:
            return kv.value.listIntValue.values as T;
          case Value_Kind.listDoubleValue:
            return kv.value.listDoubleValue.values as T;
          case Value_Kind.listBoolValue:
            return kv.value.listBoolValue.values as T;
          case Value_Kind.listBytesValue:
            return kv.value.listBytesValue.values as T;
          default:
            return null;
        }
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> getValues(List<String> keys) async {
    return await Isolate.run<Map<String, dynamic>>(() => _getValues(keys));
  }

  Map<String, dynamic> _getValues(List<String> keys) {
    Map<String, dynamic> dict = {};
    for (final key in keys) {
      dict[key] = get(key);
    }
    return dict;
  }

  Future<void>? set<T>(String key, T value) async {
    await Isolate.run(() async => await _set(key, value));
  }

  Future<void> _set<T>(String key, T value) async {
    final val = _getVal(value);
    for (final kv in _keyValueList.data) {
      if (kv.key == key) {
        if (kv.value == val) {
          return;
        }
        kv.value = val;
        await _flush();
        return;
      }
    }
    _keyValueList.data.add(KeyValue()
      ..key = key
      ..value = val);
    await _flush();
  }

  Future<void> setValues<T>(Map<String, T> entries) async {
    Isolate.run(() async => await _setValues(entries));
  }

  Future<void> _setValues<T>(Map<String, T> entries) async {
    if (_keyValueList.data.length < entries.length) {
      for (final kv in _keyValueList.data) {
        if (entries.containsKey(kv.key)) {
          final val = _getVal(entries[kv.key]);
          if (kv.value != val) {
            kv.value = val;
          } else {
            _keyValueList.data.add(KeyValue()
              ..key = kv.key
              ..value = val);
          }
          break;
        }
      }
    } else {
      for (final key in entries.keys) {
        final val = _getVal(entries[key]);
        for (final kv in _keyValueList.data) {
          if (kv.key == key) {
            if (kv.value != val) {
              kv.value = val;
              break;
            }
          }
        }
        _keyValueList.data.add(KeyValue()
          ..key = key
          ..value = val);
      }
    }
    await _flush();
  }

  Future<void>? remove(String key) async {
    await Isolate.run(() async => await _remove(key));
  }

  Future<void> _remove(String key) async {
    for (final kv in _keyValueList.data) {
      if (kv.key == key) {
        _keyValueList.data.remove(kv);
        await _flush();
      }
    }
  }

  Future<void> removeValues(List<String> keys) async {
    Isolate.run(() => _removeValues(keys));
  }

  Future<void> _removeValues(List<String> keys) async {
    for (final kv in _keyValueList.data) {
      if (keys.contains(kv.key)) {
        _keyValueList.data.remove(kv);
      }
    }
    await _flush();
  }

  Value _getVal(value) {
    final val = Value();
    if (value is String) {
      val.stringValue = value;
    } else if (value is int) {
      val.intValue = value;
    } else if (value is double) {
      val.doubleValue = value;
    } else if (value is bool) {
      val.boolValue = value;
    } else if (value is Uint8List) {
      val.bytesValue = value;
    } else if (value is List<String>) {
      val.listStringValue = (ListString()..values.addAll(value));
    } else if (value is List<int>) {
      val.listIntValue = (ListInt()..values.addAll(value));
    } else if (value is List<double>) {
      val.listDoubleValue = (ListDouble()..values.addAll(value));
    } else if (value is List<bool>) {
      val.listBoolValue = (ListBool()..values.addAll(value));
    } else if (value is List<Uint8List>) {
      val.listBytesValue = (ListBytes()..values.addAll(value));
    } else {
      throw ArgumentError('Unsupported value type');
    }
    return val;
  }

  Future<void> setString(String key, String value) async {
    await Isolate.run(
        () async => await _setValue(key, Value()..stringValue = value));
  }

  String? getString(String key) {
    return _getValue(key)?.stringValue;
  }

  Future<void> setInt(String key, int value) async {
    await Isolate.run(
        () async => await _setValue(key, Value()..intValue = value));
  }

  int? getInt(String key) {
    return _getValue(key)?.intValue;
  }

  Future<void> setDouble(String key, double value) async {
    await Isolate.run(
        () async => await _setValue(key, Value()..doubleValue = value));
  }

  double? getDouble(String key) {
    return _getValue(key)?.doubleValue;
  }

  Future<void> setBool(String key, bool value) async {
    await Isolate.run(
        () async => await _setValue(key, Value()..boolValue = value));
  }

  bool? getBool(String key) {
    return _getValue(key)?.boolValue;
  }

  Future<void> setBytes(String key, List<int> value) async {
    await Isolate.run(
        () async => await _setValue(key, Value()..bytesValue = value));
  }

  List<int>? getBytes(String key) {
    return _getValue(key)?.bytesValue;
  }

  Future<void> setStringList(String key, List<String> value) async {
    await Isolate.run(() async => await _setValue(
        key, Value()..listStringValue = (ListString()..values.addAll(value))));
  }

  List<String>? getStringList(String key) {
    return _getValue(key)?.listStringValue.values;
  }

  Future<void> setIntList(String key, List<int> value) async {
    await Isolate.run(() async => await _setValue(
        key, Value()..listIntValue = (ListInt()..values.addAll(value))));
  }

  List<int>? getIntList(String key) {
    return _getValue(key)?.listIntValue.values;
  }

  Future<void> setDoubleList(String key, List<double> value) async {
    await Isolate.run(() async => await _setValue(
        key, Value()..listDoubleValue = (ListDouble()..values.addAll(value))));
  }

  List<double>? getDoubleList(String key) {
    return _getValue(key)?.listDoubleValue.values;
  }

  Future<void> setBoolList(String key, List<bool> value) async {
    await Isolate.run(() async => await _setValue(
        key, Value()..listBoolValue = (ListBool()..values.addAll(value))));
  }

  List<bool>? getBoolList(String key) {
    return _getValue(key)?.listBoolValue.values;
  }

  Future<void> setBytesList(String key, List<List<int>> value) async {
    await Isolate.run(() async => await _setValue(
        key,
        Value()
          ..listBytesValue =
              (ListBytes()..values.addAll(value.map((e) => e)))));
  }

  List<List<int>>? getBytesList(String key) {
    return _getValue(key)?.listBytesValue.values;
  }

  Future<void> _setValue(String key, Value value) async {
    final existing = _keyValueList.data.firstWhere(
      (kv) => kv.key == key,
      orElse: () => KeyValue()..key = key,
    );
    existing.value = value;
    if (!_keyValueList.data.contains(existing)) {
      _keyValueList.data.add(existing);
    }
    await _flush();
  }

  Value? _getValue(String key) {
    return _keyValueList.data
        .firstWhere(
          (kv) => kv.key == key,
          orElse: () => KeyValue(),
        )
        .value;
  }

  Future<void> _flush() async {
    final original_bytes = _keyValueList.writeToBuffer();
    if (original_bytes.isNotEmpty) {
      final encrypted = _encrypter.encryptBytes(original_bytes, iv: _iv);
      await _file.writeAsBytes(encrypted.bytes);
    }
  }

  Future<void> clearAll() async {
    Isolate.run(() async => await _file.delete());
  }
}
