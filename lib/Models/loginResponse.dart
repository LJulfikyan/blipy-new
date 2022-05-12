import 'package:json_annotation/json_annotation.dart';

part 'loginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  int? id;
  String? login;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? token;
  int? languageId;
  String? languageNameEng;
  String? languageNameNative;
  String? logoUrl;
  Map<String, dynamic>? notification;

  LoginResponse(
      this.login,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.token,
      this.languageId,
      this.languageNameEng,
      this.languageNameNative,
      this.logoUrl,
      this.notification);

  factory LoginResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
