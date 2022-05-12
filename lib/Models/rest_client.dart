import 'package:blippy_login/Base/LanguageRequest.dart';
import 'package:blippy_login/Models/SMS_model.dart';
import 'package:blippy_login/Models/code_data.dart';
import 'package:blippy_login/Models/loginRequest.dart';
import 'package:blippy_login/Models/loginResponse.dart';
import 'package:blippy_login/Models/notificationRequest.dart';
import 'package:blippy_login/Models/phoneNumber.dart';
import 'package:blippy_login/Models/postRequest.dart';
import 'package:blippy_login/Models/register.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../Base/app_config.dart';
import 'SMS_model.dart';
import 'base_response.dart';
import 'code_data.dart';
import 'dart:core';
import 'feedData.dart';
import 'feedItems.dart';
import 'lang_strings.dart';
import 'notificationList.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/v1/Users/GetCountryCode")
  Future<BaseResponse<CodeData>?> getCountryCode();

  @POST("/api/v1/Settings/GetLanguageTexts")
  Future<BaseResponse<LangStrings>?> getStrings(
      @Body() LanguageRequest isoLanguageName);

  @POST("/api/v1/Users/SendCode")
  Future<BaseResponse<SMSModel>?> sendCode(@Body()  PhoneNumber phoneNumber );

  @POST("/api/v1/Users/Register")
  Future<BaseResponse<Register>?> register(@Body() int validationId,
      PhoneNumber phoneNumber, AppConfig password, LanguageRequest isoLanguageName);

  @POST("/api/v1/Users/ValidateCode")
  Future<BaseResponse<SMSModel>?> validateCode(@Body() ValidationRequest);

  @POST("/api/v1/Posts/Search")
  Future<BaseResponse<FeedData>?> getFeedItems(@Body() PostRequest postRequest);

  @POST("/api/v1/Users/Login")
  Future<BaseResponse<LoginResponse>?> login(@Body() LoginRequest request);

  @POST("/api/v1/Notifications/Search")
  Future<BaseResponse<NotificationList>?> getNotifications(@Body()NotificationRequest request);

  @GET('/api/v1/Posts/{id}')
  Future<BaseResponse<FeedItems>?> getPostDetails(@Path('id') int id);
}


