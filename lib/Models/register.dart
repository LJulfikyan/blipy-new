import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()

class Register{
  String? token;
  int? id;
  String? phoneNumber;
  bool? isNative;
  String? logoUrl;
  String? languageNameEng;
  String? languageNameNative;
  int? languageId;

  Register(this.token, this.id, this.phoneNumber, this.isNative, this.logoUrl,
      this.languageNameEng, this.languageNameNative, this.languageId);

  factory Register.fromJson(Map<String, dynamic> srcJson) => _$RegisterFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}