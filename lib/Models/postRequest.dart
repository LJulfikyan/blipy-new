import 'package:json_annotation/json_annotation.dart';

part 'postRequest.g.dart';

@JsonSerializable()
class PostRequest {
  int? skip;
  int? take;
  String? text;
  String? orderBy;
  String? orderDirection;
  int? timezoneOffsetInMinutes;
  bool? favorite = false;

  PostRequest(this.skip, this.take, this.favorite);


  PostRequest.all(this.skip, this.take, this.text, this.orderBy,
      this.orderDirection, this.timezoneOffsetInMinutes, this.favorite);

  factory PostRequest.fromJson(Map<String, dynamic> srcJson) =>
      _$PostRequestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostRequestToJson(this);
}
