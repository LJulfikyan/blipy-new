import 'package:json_annotation/json_annotation.dart';


part 'notificationsModel.g.dart';


@JsonSerializable()

class NotificationItem{
  int? id;
  int? postId;
  String? category;
  String? language;
  String? title;
  String? contentHtml;
  String? date;

  NotificationItem(this.id, this.postId, this.category, this.language,
      this.title, this.contentHtml, this.date);


  factory NotificationItem.fromJson(Map<String, dynamic> srcJson) => _$NotificationItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);


}