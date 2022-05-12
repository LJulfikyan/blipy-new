import 'package:json_annotation/json_annotation.dart';


part 'errorData.g.dart';

@JsonSerializable()
class ErrorsData {

  List<String>? Error;

ErrorsData();

  factory ErrorsData.fromJson(Map<String, dynamic> srcJson) => _$ErrorsDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ErrorsDataToJson(this);
}