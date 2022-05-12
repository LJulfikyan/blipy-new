import 'package:blippy_login/Base/base_controller.dart';
import 'package:blippy_login/Base/blippy_utils.dart';

class SplashController extends BaseController {
  SplashController() {
    BlipyUtils.getCode();
    BlipyUtils.getLangStrings();
    BlipyUtils.initialTextValue();

  }
}
