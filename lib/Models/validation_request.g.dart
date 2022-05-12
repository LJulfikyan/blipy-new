// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationRequest _$ValidationRequestFromJson(Map<String, dynamic> json) =>
    ValidationRequest(
      json['validationId'] as int?,
      json['code'] as int?,
    );

Map<String, dynamic> _$ValidationRequestToJson(ValidationRequest instance) =>
    <String, dynamic>{
      'validationId': instance.validationId,
      'code': instance.code,
    };
