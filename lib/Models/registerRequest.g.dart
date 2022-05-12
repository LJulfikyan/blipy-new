// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['validationId'] as int,
      json['phoneNumber'] as String,
      json['password'] as String,
      json['isoLanguageName'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'validationId': instance.validationId,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'isoLanguageName': instance.isoLanguageName,
    };
