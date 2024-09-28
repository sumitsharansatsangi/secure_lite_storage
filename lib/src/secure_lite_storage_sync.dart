import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path_provider/path_provider.dart';
import 'package:proto_google/proto_google.dart' as $0;
import 'package:secure_lite_storage/generated/storage.pb.dart';
import 'package:path/path.dart' as path;

class SecureLiteStorage {
  static final SecureLiteStorage _instance = SecureLiteStorage._internal();
  factory SecureLiteStorage() => _instance;
  SecureLiteStorage._internal();
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
    final directory = await getApplicationSupportDirectory();
    _file = File(path.join(directory.path, 'storage1.sls'));
    if (await _file.exists()) {
      final bytes = await _file.readAsBytes();
      if (bytes.isNotEmpty) {
        final decrypted =
            _encrypter.decryptBytes(encrypt.Encrypted(bytes), iv: _iv);
        _keyValueList = KeyValueList.fromBuffer(decrypted);
      }
    }
  }

  T? get<T>(String key) {
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
            if (kv.values.isNotEmpty)
              return _getValuesAsDynamic(kv.values) as T;
            else
              return null;
        }
      }
    }
    return null;
  }

  Map<String, dynamic> _getValuesAsDynamic(Map<String, $0.Any> values) {
    final Map<String, dynamic> result = {};
    for (final k in values.entries) {
      result[k.key] = anyToDynamic(k.value);
    }
    return result;
  }

  dynamic anyToDynamic($0.Any any) {
    if (any.hasValue()) {
      if (any.typeUrl.contains('StringValue')) {
        final stringValue = $0.StringValue()..mergeFromBuffer(any.value);
        return stringValue.value;
      } else if (any.typeUrl.contains('Int32Value')) {
        final intValue = $0.Int32Value()..mergeFromBuffer(any.value);
        return intValue.value;
      } else if (any.typeUrl.contains('Int64Value')) {
        final int64Value = $0.Int64Value()..mergeFromBuffer(any.value);
        return int64Value.value;
      } else if (any.typeUrl.contains('BoolValue')) {
        final boolValue = $0.BoolValue()..mergeFromBuffer(any.value);
        return boolValue.value;
      } else if (any.typeUrl.contains('DoubleValue')) {
        final doubleValue = $0.DoubleValue()..mergeFromBuffer(any.value);
        return doubleValue.value;
      } else if (any.typeUrl.contains('FloatValue')) {
        final floatValue = $0.FloatValue()..mergeFromBuffer(any.value);
        return floatValue.value;
      } else if (any.typeUrl.contains('BytesValue')) {
        final bytesValue = $0.BytesValue()..mergeFromBuffer(any.value);
        return bytesValue.value;
      } else if (any.typeUrl.contains('Timestamp')) {
        final timestamp = $0.Timestamp()..mergeFromBuffer(any.value);
        return DateTime.fromMillisecondsSinceEpoch(
            timestamp.seconds.toInt() * 1000 + timestamp.nanos ~/ 1000000);
      } else if (any.typeUrl.contains('Duration')) {
        final duration = $0.Duration()..mergeFromBuffer(any.value);
        return Duration(
            seconds: duration.seconds.toInt(),
            microseconds: duration.nanos ~/ 1000);
      } else if (any.typeUrl.contains('ListValue')) {
        final listValue = $0.ListValue()..mergeFromBuffer(any.value);
        return listValue.values
            .map((v) =>
                anyToDynamic($0.Any()..mergeFromBuffer(v.writeToBuffer())))
            .toList();
      } else if (any.typeUrl.contains('Any')) {
        return anyToDynamic($0.Any()..mergeFromBuffer(any.value));
      }
    }
    return null;
  }

  Map<String, dynamic> getValues(List<String> keys) {
    Map<String, dynamic> dict = {};
    for (final key in keys) {
      dict[key] = get(key);
    }
    return dict;
  }

  void set<T>(String key, T value) {
    final val = _getVal(value);
    for (final kv in _keyValueList.data) {
      if (kv.key == key) {
        if (kv.value != val) {
          kv.value = val;
          _flush();
          return;
        }
      }
    }
    _keyValueList.data.add(KeyValue()
      ..key = key
      ..value = val);
    _flush();
  }

  void setValues<T>(Map<String, T> entries) {
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
    _flush();
  }

  void remove(String key) {
    for (final kv in _keyValueList.data) {
      if (kv.key == key) {
        _keyValueList.data.remove(kv);
        _flush();
      }
    }
  }

  void removeValues(List<String> keys) {
    for (final kv in _keyValueList.data) {
      if (keys.contains(kv.key)) {
        _keyValueList.data.remove(kv);
      }
    }
    _flush();
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

  void setString(String key, String value) {
    _setValue(key, Value()..stringValue = value);
  }

  String? getString(String key) {
    return _getValue(key)?.stringValue;
  }

  void setInt(String key, int value) {
    _setValue(key, Value()..intValue = value);
  }

  int? getInt(String key) {
    return _getValue(key)?.intValue;
  }

  void setDouble(String key, double value) {
    _setValue(key, Value()..doubleValue = value);
  }

  double? getDouble(String key) {
    return _getValue(key)?.doubleValue;
  }

  void setBool(String key, bool value) {
    _setValue(key, Value()..boolValue = value);
  }

  bool? getBool(String key) {
    return _getValue(key)?.boolValue;
  }

  void setBytes(String key, List<int> value) {
    _setValue(key, Value()..bytesValue = value);
  }

  List<int>? getBytes(String key) {
    return _getValue(key)?.bytesValue;
  }

  void setStringList(String key, List<String> value) {
    _setValue(
        key, Value()..listStringValue = (ListString()..values.addAll(value)));
  }

  List<String>? getStringList(String key) {
    return _getValue(key)?.listStringValue.values;
  }

  void setIntList(String key, List<int> value) {
    _setValue(key, Value()..listIntValue = (ListInt()..values.addAll(value)));
  }

  List<int>? getIntList(String key) {
    return _getValue(key)?.listIntValue.values;
  }

  void setDoubleList(String key, List<double> value) {
    _setValue(
        key, Value()..listDoubleValue = (ListDouble()..values.addAll(value)));
  }

  List<double>? getDoubleList(String key) {
    return _getValue(key)?.listDoubleValue.values;
  }

  void setBoolList(String key, List<bool> value) {
    _setValue(key, Value()..listBoolValue = (ListBool()..values.addAll(value)));
  }

  List<bool>? getBoolList(String key) {
    return _getValue(key)?.listBoolValue.values;
  }

  void setBytesList(String key, List<List<int>> value) {
    _setValue(
        key,
        Value()
          ..listBytesValue = (ListBytes()..values.addAll(value.map((e) => e))));
  }

  List<List<int>>? getBytesList(String key) {
    return _getValue(key)?.listBytesValue.values;
  }

  void _setValue(String key, Value value) {
    final existing = _keyValueList.data.firstWhere(
      (kv) => kv.key == key,
      orElse: () => KeyValue()..key = key,
    );
    existing.value = value;
    if (!_keyValueList.data.contains(existing)) {
      _keyValueList.data.add(existing);
    }
    _flush();
  }

  Value? _getValue(String key) {
    return _keyValueList.data
        .firstWhere(
          (kv) => kv.key == key,
          orElse: () => KeyValue(),
        )
        .value;
  }

  void _flush() {
    final original_bytes = _keyValueList.writeToBuffer();
    if (original_bytes.isNotEmpty) {
      final encrypted = _encrypter.encryptBytes(original_bytes, iv: _iv);
      _file.writeAsBytesSync(encrypted.bytes);
    }
  }

  void clearAll() {
    if (_file.existsSync()) {
      _file.deleteSync();
    }
  }
}
