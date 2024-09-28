//
//  Generated code. Do not modify.
//  source: storage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:proto_google/proto_google.dart' as $0;

// import 'google/protobuf/any.pb.dart' as $0;

class KeyValueList extends $pb.GeneratedMessage {
  factory KeyValueList({
    $core.Iterable<KeyValue>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data.addAll(data);
    }
    return $result;
  }
  KeyValueList._() : super();
  factory KeyValueList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyValueList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KeyValueList', createEmptyInstance: create)
    ..pc<KeyValue>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PM, subBuilder: KeyValue.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyValueList clone() => KeyValueList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyValueList copyWith(void Function(KeyValueList) updates) => super.copyWith((message) => updates(message as KeyValueList)) as KeyValueList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyValueList create() => KeyValueList._();
  KeyValueList createEmptyInstance() => create();
  static $pb.PbList<KeyValueList> createRepeated() => $pb.PbList<KeyValueList>();
  @$core.pragma('dart2js:noInline')
  static KeyValueList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyValueList>(create);
  static KeyValueList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KeyValue> get data => $_getList(0);
}

class KeyValue extends $pb.GeneratedMessage {
  factory KeyValue({
    $core.String? key,
    Value? value,
    $core.Map<$core.String, $0.Any>? values,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  KeyValue._() : super();
  factory KeyValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KeyValue', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOM<Value>(2, _omitFieldNames ? '' : 'value', subBuilder: Value.create)
    ..m<$core.String, $0.Any>(3, _omitFieldNames ? '' : 'values', entryClassName: 'KeyValue.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: $0.Any.create, valueDefaultOrMaker: $0.Any.getDefault)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyValue clone() => KeyValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyValue copyWith(void Function(KeyValue) updates) => super.copyWith((message) => updates(message as KeyValue)) as KeyValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyValue create() => KeyValue._();
  KeyValue createEmptyInstance() => create();
  static $pb.PbList<KeyValue> createRepeated() => $pb.PbList<KeyValue>();
  @$core.pragma('dart2js:noInline')
  static KeyValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyValue>(create);
  static KeyValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  Value get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  Value ensureValue() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $0.Any> get values => $_getMap(2);
}

enum Value_Kind {
  stringValue, 
  intValue, 
  doubleValue, 
  boolValue, 
  bytesValue, 
  listStringValue, 
  listIntValue, 
  listDoubleValue, 
  listBoolValue, 
  listBytesValue, 
  notSet
}

class Value extends $pb.GeneratedMessage {
  factory Value({
    $core.String? stringValue,
    $core.int? intValue,
    $core.double? doubleValue,
    $core.bool? boolValue,
    $core.List<$core.int>? bytesValue,
    ListString? listStringValue,
    ListInt? listIntValue,
    ListDouble? listDoubleValue,
    ListBool? listBoolValue,
    ListBytes? listBytesValue,
  }) {
    final $result = create();
    if (stringValue != null) {
      $result.stringValue = stringValue;
    }
    if (intValue != null) {
      $result.intValue = intValue;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (bytesValue != null) {
      $result.bytesValue = bytesValue;
    }
    if (listStringValue != null) {
      $result.listStringValue = listStringValue;
    }
    if (listIntValue != null) {
      $result.listIntValue = listIntValue;
    }
    if (listDoubleValue != null) {
      $result.listDoubleValue = listDoubleValue;
    }
    if (listBoolValue != null) {
      $result.listBoolValue = listBoolValue;
    }
    if (listBytesValue != null) {
      $result.listBytesValue = listBytesValue;
    }
    return $result;
  }
  Value._() : super();
  factory Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Value_Kind> _Value_KindByTag = {
    1 : Value_Kind.stringValue,
    2 : Value_Kind.intValue,
    3 : Value_Kind.doubleValue,
    4 : Value_Kind.boolValue,
    5 : Value_Kind.bytesValue,
    6 : Value_Kind.listStringValue,
    7 : Value_Kind.listIntValue,
    8 : Value_Kind.listDoubleValue,
    9 : Value_Kind.listBoolValue,
    10 : Value_Kind.listBytesValue,
    0 : Value_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Value', createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    ..aOS(1, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'intValue', $pb.PbFieldType.O3, protoName: 'intValue')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD, protoName: 'doubleValue')
    ..aOB(4, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'bytesValue', $pb.PbFieldType.OY, protoName: 'bytesValue')
    ..aOM<ListString>(6, _omitFieldNames ? '' : 'listStringValue', protoName: 'listStringValue', subBuilder: ListString.create)
    ..aOM<ListInt>(7, _omitFieldNames ? '' : 'listIntValue', protoName: 'listIntValue', subBuilder: ListInt.create)
    ..aOM<ListDouble>(8, _omitFieldNames ? '' : 'listDoubleValue', protoName: 'listDoubleValue', subBuilder: ListDouble.create)
    ..aOM<ListBool>(9, _omitFieldNames ? '' : 'listBoolValue', protoName: 'listBoolValue', subBuilder: ListBool.create)
    ..aOM<ListBytes>(10, _omitFieldNames ? '' : 'listBytesValue', protoName: 'listBytesValue', subBuilder: ListBytes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Value clone() => Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Value copyWith(void Function(Value) updates) => super.copyWith((message) => updates(message as Value)) as Value;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Value create() => Value._();
  Value createEmptyInstance() => create();
  static $pb.PbList<Value> createRepeated() => $pb.PbList<Value>();
  @$core.pragma('dart2js:noInline')
  static Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Value>(create);
  static Value? _defaultInstance;

  Value_Kind whichKind() => _Value_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get stringValue => $_getSZ(0);
  @$pb.TagNumber(1)
  set stringValue($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStringValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get intValue => $_getIZ(1);
  @$pb.TagNumber(2)
  set intValue($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIntValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get doubleValue => $_getN(2);
  @$pb.TagNumber(3)
  set doubleValue($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDoubleValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearDoubleValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(3);
  @$pb.TagNumber(4)
  set boolValue($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoolValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get bytesValue => $_getN(4);
  @$pb.TagNumber(5)
  set bytesValue($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBytesValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearBytesValue() => clearField(5);

  @$pb.TagNumber(6)
  ListString get listStringValue => $_getN(5);
  @$pb.TagNumber(6)
  set listStringValue(ListString v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasListStringValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearListStringValue() => clearField(6);
  @$pb.TagNumber(6)
  ListString ensureListStringValue() => $_ensure(5);

  @$pb.TagNumber(7)
  ListInt get listIntValue => $_getN(6);
  @$pb.TagNumber(7)
  set listIntValue(ListInt v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasListIntValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearListIntValue() => clearField(7);
  @$pb.TagNumber(7)
  ListInt ensureListIntValue() => $_ensure(6);

  @$pb.TagNumber(8)
  ListDouble get listDoubleValue => $_getN(7);
  @$pb.TagNumber(8)
  set listDoubleValue(ListDouble v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasListDoubleValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearListDoubleValue() => clearField(8);
  @$pb.TagNumber(8)
  ListDouble ensureListDoubleValue() => $_ensure(7);

  @$pb.TagNumber(9)
  ListBool get listBoolValue => $_getN(8);
  @$pb.TagNumber(9)
  set listBoolValue(ListBool v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasListBoolValue() => $_has(8);
  @$pb.TagNumber(9)
  void clearListBoolValue() => clearField(9);
  @$pb.TagNumber(9)
  ListBool ensureListBoolValue() => $_ensure(8);

  @$pb.TagNumber(10)
  ListBytes get listBytesValue => $_getN(9);
  @$pb.TagNumber(10)
  set listBytesValue(ListBytes v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasListBytesValue() => $_has(9);
  @$pb.TagNumber(10)
  void clearListBytesValue() => clearField(10);
  @$pb.TagNumber(10)
  ListBytes ensureListBytesValue() => $_ensure(9);
}

class ListString extends $pb.GeneratedMessage {
  factory ListString({
    $core.Iterable<$core.String>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  ListString._() : super();
  factory ListString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListString', createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'values')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListString clone() => ListString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListString copyWith(void Function(ListString) updates) => super.copyWith((message) => updates(message as ListString)) as ListString;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListString create() => ListString._();
  ListString createEmptyInstance() => create();
  static $pb.PbList<ListString> createRepeated() => $pb.PbList<ListString>();
  @$core.pragma('dart2js:noInline')
  static ListString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListString>(create);
  static ListString? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get values => $_getList(0);
}

class ListInt extends $pb.GeneratedMessage {
  factory ListInt({
    $core.Iterable<$core.int>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  ListInt._() : super();
  factory ListInt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInt', createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInt clone() => ListInt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInt copyWith(void Function(ListInt) updates) => super.copyWith((message) => updates(message as ListInt)) as ListInt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInt create() => ListInt._();
  ListInt createEmptyInstance() => create();
  static $pb.PbList<ListInt> createRepeated() => $pb.PbList<ListInt>();
  @$core.pragma('dart2js:noInline')
  static ListInt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInt>(create);
  static ListInt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get values => $_getList(0);
}

class ListDouble extends $pb.GeneratedMessage {
  factory ListDouble({
    $core.Iterable<$core.double>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  ListDouble._() : super();
  factory ListDouble.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDouble.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListDouble', createEmptyInstance: create)
    ..p<$core.double>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.KD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDouble clone() => ListDouble()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDouble copyWith(void Function(ListDouble) updates) => super.copyWith((message) => updates(message as ListDouble)) as ListDouble;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDouble create() => ListDouble._();
  ListDouble createEmptyInstance() => create();
  static $pb.PbList<ListDouble> createRepeated() => $pb.PbList<ListDouble>();
  @$core.pragma('dart2js:noInline')
  static ListDouble getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDouble>(create);
  static ListDouble? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.double> get values => $_getList(0);
}

class ListBool extends $pb.GeneratedMessage {
  factory ListBool({
    $core.Iterable<$core.bool>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  ListBool._() : super();
  factory ListBool.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBool.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListBool', createEmptyInstance: create)
    ..p<$core.bool>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.KB)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBool clone() => ListBool()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBool copyWith(void Function(ListBool) updates) => super.copyWith((message) => updates(message as ListBool)) as ListBool;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBool create() => ListBool._();
  ListBool createEmptyInstance() => create();
  static $pb.PbList<ListBool> createRepeated() => $pb.PbList<ListBool>();
  @$core.pragma('dart2js:noInline')
  static ListBool getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBool>(create);
  static ListBool? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.bool> get values => $_getList(0);
}

class ListBytes extends $pb.GeneratedMessage {
  factory ListBytes({
    $core.Iterable<$core.List<$core.int>>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  ListBytes._() : super();
  factory ListBytes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBytes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListBytes', createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBytes clone() => ListBytes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBytes copyWith(void Function(ListBytes) updates) => super.copyWith((message) => updates(message as ListBytes)) as ListBytes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBytes create() => ListBytes._();
  ListBytes createEmptyInstance() => create();
  static $pb.PbList<ListBytes> createRepeated() => $pb.PbList<ListBytes>();
  @$core.pragma('dart2js:noInline')
  static ListBytes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBytes>(create);
  static ListBytes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get values => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
