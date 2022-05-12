// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) =>
    NotificationRequest(
      json['skip'] as int?,
      json['take'] as int?,
    )
      ..categoryId = json['categoryId'] as int?
      ..text = json['text'] as String?
      ..orderBy = json['orderBy'] as String?
      ..orderDirection = json['orderDirection'] as String?;

Map<String, dynamic> _$NotificationRequestToJson(
        NotificationRequest instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'text': instance.text,
      'skip': instance.skip,
      'take': instance.take,
      'orderBy': instance.orderBy,
      'orderDirection': instance.orderDirection,
    };
