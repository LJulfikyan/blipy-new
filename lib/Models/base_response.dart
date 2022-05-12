import 'package:json_annotation/json_annotation.dart';

import 'errorData.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class
BaseResponse<T> {

  String? status;
  T? data;
  ErrorsData? errors;
  bool? success;

  BaseResponse();

  factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

