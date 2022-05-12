// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) =>
    NotificationItem(
      json['id'] as int?,
      json['postId'] as int?,
      json['category'] as String?,
      json['language'] as String?,
      json['title'] as String?,
      json['contentHtml'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$NotificationItemToJson(NotificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'category': instance.category,
      'language': instance.language,
      'title': instance.title,
      'contentHtml': instance.contentHtml,
      'date': instance.date,
    };
