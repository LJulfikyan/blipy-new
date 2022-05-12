import 'package:json_annotation/json_annotation.dart';

part 'validation_request.g.dart';

@JsonSerializable()
class ValidationRequest {

  int? validationId;
  int? code;

  ValidationRequest(this.validationId,this.code);


  factory ValidationRequest.fromJson(Map<String, dynamic> srcJson) => _$ValidationRequestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ValidationRequestToJson(this);
}