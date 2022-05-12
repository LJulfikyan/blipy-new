import 'package:json_annotation/json_annotation.dart';

part 'LanguageRequest.g.dart';

@JsonSerializable()
class LanguageRequest {
  String isoLanguageName;

  LanguageRequest(this.isoLanguageName);

  Map<String, dynamic> toJson() => _$LanguageRequestToJson(this);
}
