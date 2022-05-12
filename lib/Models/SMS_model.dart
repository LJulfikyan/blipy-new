import 'package:json_annotation/json_annotation.dart';

part 'SMS_model.g.dart';

@JsonSerializable()
class SMSModel {
  int? validationId;
  int? code;

  SMSModel({this.validationId, this.code});

  factory SMSModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SMSModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SMSModelToJson(this);
}
