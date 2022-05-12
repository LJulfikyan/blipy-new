import 'package:json_annotation/json_annotation.dart';


part 'registerRequest.g.dart';

@JsonSerializable()
class RegisterRequest {

  late int validationId;
  late String phoneNumber;
  late String password;
 late String isoLanguageName;

  RegisterRequest(
      this.validationId, this.phoneNumber, this.password, this.isoLanguageName);


  factory   RegisterRequest.fromJson(Map<String, dynamic> srcJson) => _$RegisterRequestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}