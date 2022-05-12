// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      json['token'] as String?,
      json['id'] as int?,
      json['phoneNumber'] as String?,
      json['isNative'] as bool?,
      json['logoUrl'] as String?,
      json['languageNameEng'] as String?,
      json['languageNameNative'] as String?,
      json['languageId'] as int?,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'isNative': instance.isNative,
      'logoUrl': instance.logoUrl,
      'languageNameEng': instance.languageNameEng,
      'languageNameNative': instance.languageNameNative,
      'languageId': instance.languageId,
    };
