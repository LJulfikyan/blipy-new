// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedItems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItems _$FeedItemsFromJson(Map<String, dynamic> json) => FeedItems(
      json['id'] as int?,
      json['logoUrl'] as String,
      json['title'] as String?,
      json['contentHtml'] as String?,
      json['date'] as String?,
      json['category'] as String?,
      json['channelId'] as int?,
      json['favorite'] as bool?,
    );

Map<String, dynamic> _$FeedItemsToJson(FeedItems instance) => <String, dynamic>{
      'id': instance.id,
      'logoUrl': instance.logoUrl,
      'title': instance.title,
      'contentHtml': instance.contentHtml,
      'date': instance.date,
      'category': instance.category,
      'channelId': instance.channelId,
      'favorite': instance.favorite,
    };
