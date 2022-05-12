import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
export 'package:get/get.dart';

abstract class BaseController extends GetxController {
  static const MethodChannel methodChannel = MethodChannel('ARCTXChannel');
  // Connection status
  late StreamSubscription _connectionChangeStream;
  var isOffline = false.obs;


  //
  // Future<void> isTokenValidYet() async {
  //   SignInModel? signInModel = await getSignInInfo();
  //   if (signInModel != null &&
  //       signInModel.token != null &&
  //       signInModel.token!.isNotEmpty) {
  //     final nowInMillis = DateTime.now().millisecondsSinceEpoch;
  //     final timeInMillis = signInModel.expirationepoch ?? 0;
  //     final refreshTimeInMillis = signInModel.refreshTokenExpirationepoch ?? 0;
  //     if (timeInMillis != 0 &&
  //         nowInMillis > timeInMillis * 1000 &&
  //         refreshTimeInMillis != 0 &&
  //         nowInMillis < refreshTimeInMillis * 1000) {
  //       resetToken();
  //     }
  //     if (refreshTimeInMillis != 0 &&
  //         refreshTimeInMillis * 1000 < nowInMillis) {
  //       AppConfig.logout();
  //     }
  //   }
  // }
  //
  // resetToken() async {
  //   SignInModel? signInModel = await getSignInInfo();
  //   if (signInModel != null &&
  //       signInModel.refreshToken != null &&
  //       signInModel.refreshToken!.isNotEmpty) {
  //     SignInModel request = SignInModel();
  //     request.refreshTokenStr = signInModel.refreshToken ?? "";
  //     var httpResponse = await CallApi.getRestClient().refreshToken(request);
  //     if (httpResponse?.success ?? false) {
  //       if (httpResponse?.data != null) {
  //         saveToken(httpResponse?.data);
  //       }
  //     }
  //   }
  // }
  //
  // void saveToken(SignInModel? response, {String pin = ""}) {
  //   AppConfig.tokenStringKey = response?.token ?? "";
  //   AppConfig.refreshTokenKey = response?.refreshToken ?? "";
  //   AppConfig.signInModel = response;
  //   secureStorage.write(
  //       key: Constant.SIGN_IN_INFO, value: jsonEncode(response));
  //   if (pin != "") {
  //     secureStorage.write(key: Constant.PIN_CODE, value: pin);
  //   }
  // }
  //
  // void saveTokenFirebase(String? tokenFirebase) {
  //   var request = FirebaseRequest();
  //   request.fireBaseToken = tokenFirebase;
  //   CallApi.getRestClient().saveFirebaseToken(request);
  // }






  @override
  void onClose() {
    log("ON CLOSE: $runtimeType");
    _connectionChangeStream.cancel();
    super.onClose();
  }
}
