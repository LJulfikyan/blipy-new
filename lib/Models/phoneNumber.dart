import 'package:json_annotation/json_annotation.dart';

part 'phoneNumber.g.dart';

@JsonSerializable()
class PhoneNumber {

   String phoneNumber;

  PhoneNumber(this.phoneNumber);


  factory PhoneNumber.fromJson(Map<String, dynamic> srcJson) => _$PhoneNumberFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}