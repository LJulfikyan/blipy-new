import 'package:json_annotation/json_annotation.dart';

part 'notificationRequest.g.dart';



@JsonSerializable()
class NotificationRequest{
  int? categoryId;
  String? text;
  int? skip;
  int? take;
  String? orderBy;
  String? orderDirection;

  NotificationRequest( this.skip, this.take);


  factory NotificationRequest.fromJson(Map<String, dynamic> srcJson) => _$NotificationRequestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NotificationRequestToJson(this);
}