// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => PostRequest(
      json['skip'] as int?,
      json['take'] as int?,
      json['favorite'] as bool?,
    )
      ..text = json['text'] as String?
      ..orderBy = json['orderBy'] as String?
      ..orderDirection = json['orderDirection'] as String?
      ..timezoneOffsetInMinutes = json['timezoneOffsetInMinutes'] as int?;

Map<String, dynamic> _$PostRequestToJson(PostRequest instance) =>
    <String, dynamic>{
      'skip': instance.skip,
      'take': instance.take,
      'text': instance.text,
      'orderBy': instance.orderBy,
      'orderDirection': instance.orderDirection,
      'timezoneOffsetInMinutes': instance.timezoneOffsetInMinutes,
      'favorite': instance.favorite,
    };
