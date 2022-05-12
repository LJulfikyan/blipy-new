import 'package:json_annotation/json_annotation.dart';

part 'feedItems.g.dart';


@JsonSerializable()

class FeedItems {
  int? id;
  String logoUrl = "";
  String? title;
  String? contentHtml;
  String? date;
  String? category;
  int? channelId;
  bool? favorite ;

  FeedItems(this.id, this.logoUrl, this.title, this.contentHtml, this.date,
      this.category, this.channelId, this.favorite);


  factory FeedItems.fromJson(Map<String, dynamic> srcJson) => _$FeedItemsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FeedItemsToJson(this);
}