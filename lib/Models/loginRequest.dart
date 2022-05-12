import 'package:json_annotation/json_annotation.dart';

part 'loginRequest.g.dart';

@JsonSerializable()
class LoginRequest{
  String? login;
  String? password;

  LoginRequest(this.login, this.password);

  factory LoginRequest.fromJson(Map<String, dynamic> srcJson) => _$LoginRequestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

}