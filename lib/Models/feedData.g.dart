// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedData _$FeedDataFromJson(Map<String, dynamic> json) => FeedData(
      json['total'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => FeedItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedDataToJson(FeedData instance) => <String, dynamic>{
      'total': instance.total,
      'items': instance.items,
    };
