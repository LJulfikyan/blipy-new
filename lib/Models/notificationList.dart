import 'package:blippy_login/Models/notificationsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notificationList.g.dart';


@JsonSerializable()

class NotificationList {
  int? total;
  List<NotificationItem>? items;

  NotificationList(this.total, this.items);


  factory NotificationList.fromJson(Map<String, dynamic> srcJson) => _$NotificationListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}