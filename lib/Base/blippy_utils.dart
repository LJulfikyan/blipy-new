import 'package:blippy_login/Models/feedData.dart';
import 'package:blippy_login/Models/notificationList.dart';
import 'package:blippy_login/Models/phoneNumber.dart';
import 'package:blippy_login/Models/postRequest.dart';
import 'package:blippy_login/Services/Storage.dart';
import 'LanguageRequest.dart';
import 'call_api.dart';
import 'app_config.dart';

class BlipyUtils {
  static getCode() async {
    var httpResponse = await CallApi.getRestClient().getCountryCode();
    if (httpResponse?.data != null) {
      AppConfig.countryCodeData = httpResponse!.data;
    }
  }

  static getLangStrings() async {
    var request = LanguageRequest('en');
    var httpResponse = await CallApi.getRestClient().getStrings(request);
    if (httpResponse?.data?.data != null) {
      AppConfig.langStrings = httpResponse?.data?.data;
    }
  }

  static initialTextValue() {
    if (AppConfig.countryCodeData?.countryCallingCode != null) {
      AppConfig.countryCodeData?.countryCallingCode;
    } else {
      return "";
    }
  }

  static bool hasToken() {
    if (SecureStorage.readSecureData('token') != '' ||
        SecureStorage.readSecureData('token') != null) {
      return true;
    }
    else{
      return false;
    }
  }

  static createUser(validationId, number, password, isoLanguageName) async {
    PhoneNumber phoneNumber = PhoneNumber(number);
    isoLanguageName = LanguageRequest('en');
    var httpResponse = await CallApi.getRestClient()
        .register(validationId, phoneNumber, password, isoLanguageName);
    if (httpResponse?.data != null) {
      AppConfig.userInfo = httpResponse?.data as Map<String, dynamic>?;
      SecureStorage.writeSecureData('token', httpResponse!.data!.token);
    }
  }

  static Future<FeedData?> getFeedItems(PostRequest postRequest) async {
    var httpResponse = await CallApi.getRestClient().getFeedItems(postRequest);
    if (httpResponse?.data != null) {
      return httpResponse?.data;
    }
    return null;
  }

  static Future<NotificationList?> getNotifications(request) async {
    var httpResponse = await CallApi.getRestClient().getNotifications(request);
    if (httpResponse?.data != null) {
      return httpResponse?.data;
    }
    return null;
  }

  static getPostDetails(id) async {
    var httpResponse = await CallApi.getRestClient().getPostDetails(id);
    if (httpResponse?.data != null) {
      return httpResponse?.data;
    }
  }
}
