// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errorData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorsData _$ErrorsDataFromJson(Map<String, dynamic> json) => ErrorsData()
  ..Error = (json['Error'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ErrorsDataToJson(ErrorsData instance) =>
    <String, dynamic>{
      'Error': instance.Error,
    };
