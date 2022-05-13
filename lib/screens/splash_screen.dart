import 'package:blippy_login/Base/app_config.dart';
import 'package:blippy_login/Base/blippy_utils.dart';
import 'package:blippy_login/Services/Storage.dart';
import 'package:blippy_login/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import '../Base/base_screen.dart';
import '../Base/bottomNavBar.dart';
import '../controllers/splash_controller.dart';
import '../main.dart';

class SplashScreen extends BaseScreen<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  Widget route() {
    if (BlipyUtils.hasToken()) {
      AppConfig.tokenStringKey = SecureStorage.readSecureData('token');
      return const MainScreen();
    } else {
      return const BlippyLoginPage();
    }
  }

  @override
  Widget builder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF92DA7F),
            Color(0xFF40BCA1),
          ],
        ),
      ),
      child: Center(
        child: SplashWidget(
            onComplete: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => route()),
                  ),
                }),
      ),
    );
  }

  @override
  SplashController putController() {
    return SplashController();
  }
}
