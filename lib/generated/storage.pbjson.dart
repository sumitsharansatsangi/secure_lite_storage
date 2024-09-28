//
//  Generated code. Do not modify.
//  source: storage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use keyValueListDescriptor instead')
const KeyValueList$json = {
  '1': 'KeyValueList',
  '2': [
    {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.KeyValue', '10': 'data'},
  ],
};

/// Descriptor for `KeyValueList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyValueListDescriptor = $convert.base64Decode(
    'CgxLZXlWYWx1ZUxpc3QSHQoEZGF0YRgBIAMoCzIJLktleVZhbHVlUgRkYXRh');

@$core.Deprecated('Use keyValueDescriptor instead')
const KeyValue$json = {
  '1': 'KeyValue',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.Value', '10': 'value'},
    {'1': 'values', '3': 3, '4': 3, '5': 11, '6': '.KeyValue.ValuesEntry', '10': 'values'},
  ],
  '3': [KeyValue_ValuesEntry$json],
};

@$core.Deprecated('Use keyValueDescriptor instead')
const KeyValue_ValuesEntry$json = {
  '1': 'ValuesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `KeyValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyValueDescriptor = $convert.base64Decode(
    'CghLZXlWYWx1ZRIQCgNrZXkYASABKAlSA2tleRIcCgV2YWx1ZRgCIAEoCzIGLlZhbHVlUgV2YW'
    'x1ZRItCgZ2YWx1ZXMYAyADKAsyFS5LZXlWYWx1ZS5WYWx1ZXNFbnRyeVIGdmFsdWVzGk8KC1Zh'
    'bHVlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EioKBXZhbHVlGAIgASgLMhQuZ29vZ2xlLnByb3'
    'RvYnVmLkFueVIFdmFsdWU6AjgB');

@$core.Deprecated('Use valueDescriptor instead')
const Value$json = {
  '1': 'Value',
  '2': [
    {'1': 'stringValue', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    {'1': 'intValue', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'intValue'},
    {'1': 'doubleValue', '3': 3, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'boolValue', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'bytesValue', '3': 5, '4': 1, '5': 12, '9': 0, '10': 'bytesValue'},
    {'1': 'listStringValue', '3': 6, '4': 1, '5': 11, '6': '.ListString', '9': 0, '10': 'listStringValue'},
    {'1': 'listIntValue', '3': 7, '4': 1, '5': 11, '6': '.ListInt', '9': 0, '10': 'listIntValue'},
    {'1': 'listDoubleValue', '3': 8, '4': 1, '5': 11, '6': '.ListDouble', '9': 0, '10': 'listDoubleValue'},
    {'1': 'listBoolValue', '3': 9, '4': 1, '5': 11, '6': '.ListBool', '9': 0, '10': 'listBoolValue'},
    {'1': 'listBytesValue', '3': 10, '4': 1, '5': 11, '6': '.ListBytes', '9': 0, '10': 'listBytesValue'},
  ],
  '8': [
    {'1': 'kind'},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode(
    'CgVWYWx1ZRIiCgtzdHJpbmdWYWx1ZRgBIAEoCUgAUgtzdHJpbmdWYWx1ZRIcCghpbnRWYWx1ZR'
    'gCIAEoBUgAUghpbnRWYWx1ZRIiCgtkb3VibGVWYWx1ZRgDIAEoAUgAUgtkb3VibGVWYWx1ZRIe'
    'Cglib29sVmFsdWUYBCABKAhIAFIJYm9vbFZhbHVlEiAKCmJ5dGVzVmFsdWUYBSABKAxIAFIKYn'
    'l0ZXNWYWx1ZRI3Cg9saXN0U3RyaW5nVmFsdWUYBiABKAsyCy5MaXN0U3RyaW5nSABSD2xpc3RT'
    'dHJpbmdWYWx1ZRIuCgxsaXN0SW50VmFsdWUYByABKAsyCC5MaXN0SW50SABSDGxpc3RJbnRWYW'
    'x1ZRI3Cg9saXN0RG91YmxlVmFsdWUYCCABKAsyCy5MaXN0RG91YmxlSABSD2xpc3REb3VibGVW'
    'YWx1ZRIxCg1saXN0Qm9vbFZhbHVlGAkgASgLMgkuTGlzdEJvb2xIAFINbGlzdEJvb2xWYWx1ZR'
    'I0Cg5saXN0Qnl0ZXNWYWx1ZRgKIAEoCzIKLkxpc3RCeXRlc0gAUg5saXN0Qnl0ZXNWYWx1ZUIG'
    'CgRraW5k');

@$core.Deprecated('Use listStringDescriptor instead')
const ListString$json = {
  '1': 'ListString',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 9, '10': 'values'},
  ],
};

/// Descriptor for `ListString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStringDescriptor = $convert.base64Decode(
    'CgpMaXN0U3RyaW5nEhYKBnZhbHVlcxgBIAMoCVIGdmFsdWVz');

@$core.Deprecated('Use listIntDescriptor instead')
const ListInt$json = {
  '1': 'ListInt',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 5, '10': 'values'},
  ],
};

/// Descriptor for `ListInt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIntDescriptor = $convert.base64Decode(
    'CgdMaXN0SW50EhYKBnZhbHVlcxgBIAMoBVIGdmFsdWVz');

@$core.Deprecated('Use listDoubleDescriptor instead')
const ListDouble$json = {
  '1': 'ListDouble',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 1, '10': 'values'},
  ],
};

/// Descriptor for `ListDouble`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDoubleDescriptor = $convert.base64Decode(
    'CgpMaXN0RG91YmxlEhYKBnZhbHVlcxgBIAMoAVIGdmFsdWVz');

@$core.Deprecated('Use listBoolDescriptor instead')
const ListBool$json = {
  '1': 'ListBool',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 8, '10': 'values'},
  ],
};

/// Descriptor for `ListBool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBoolDescriptor = $convert.base64Decode(
    'CghMaXN0Qm9vbBIWCgZ2YWx1ZXMYASADKAhSBnZhbHVlcw==');

@$core.Deprecated('Use listBytesDescriptor instead')
const ListBytes$json = {
  '1': 'ListBytes',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 12, '10': 'values'},
  ],
};

/// Descriptor for `ListBytes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBytesDescriptor = $convert.base64Decode(
    'CglMaXN0Qnl0ZXMSFgoGdmFsdWVzGAEgAygMUgZ2YWx1ZXM=');

