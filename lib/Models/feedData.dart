import 'package:blippy_login/Models/feedItems.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedData.g.dart';
@JsonSerializable()

class FeedData {
  int? total;
  List<FeedItems>? items;


  FeedData(this.total, this.items);


  factory FeedData.fromJson(Map<String, dynamic> srcJson) => _$FeedDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FeedDataToJson(this);
}