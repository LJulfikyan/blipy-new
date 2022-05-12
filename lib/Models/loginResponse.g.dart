// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['login'] as String?,
      json['phoneNumber'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['token'] as String?,
      json['languageId'] as int?,
      json['languageNameEng'] as String?,
      json['languageNameNative'] as String?,
      json['logoUrl'] as String?,
      json['notification'] as Map<String, dynamic>?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'token': instance.token,
      'languageId': instance.languageId,
      'languageNameEng': instance.languageNameEng,
      'languageNameNative': instance.languageNameNative,
      'logoUrl': instance.logoUrl,
      'notification': instance.notification,
    };
