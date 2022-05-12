
import 'package:json_annotation/json_annotation.dart';

part'code_data.g.dart';

@JsonSerializable()
class CodeData {
  String? countryCode;
  String? countryCallingCode;
  String? ipAddress;


  CodeData(this.countryCode, this.countryCallingCode, this.ipAddress);

  factory CodeData.fromJson(Map<String, dynamic> srcJson) => _$CodeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CodeDataToJson(this);

}

