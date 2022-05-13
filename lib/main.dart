import 'package:blippy_login/Base/app_config.dart';
import 'package:blippy_login/Base/bottomNavBar.dart';
import 'package:blippy_login/Services/Storage.dart';
import 'package:blippy_login/forgotPassPage.dart';
import 'package:blippy_login/screens/sign_up_phone.dart';
import 'package:blippy_login/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'Base/call_api.dart';
import 'Models/loginRequest.dart';
export 'package:blippy_login/forgotPassPage.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class BlippyLogin extends StatelessWidget {
  const BlippyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlippyLoginPage(),
    );
  }
}

class BlippyLoginPage extends StatefulWidget {
  const BlippyLoginPage({Key? key,}) : super(key: key);

  @override
  State<BlippyLoginPage> createState() => _BlippyLoginPageState();
}

class _BlippyLoginPageState extends State<BlippyLoginPage> {
  bool _value = true;
  bool isObscure = true;

  login(phoneNumber, password) async {
    LoginRequest request = LoginRequest(phoneNumber, password);
    var httpResponse = await CallApi.getRestClient().login(request);
    AppConfig.tokenStringKey = httpResponse?.data?.token ?? "";
    if (httpResponse?.data?.token != null) {
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
      if (_value = true){
        SecureStorage.writeSecureData('token', httpResponse!.data!.token);
      }
    }
  }

  TextEditingController? phoneNumber = TextEditingController(
    text: AppConfig.countryCodeData?.countryCallingCode,
  );
  TextEditingController? password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppConfig.langStrings!["Login_Header"]),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFF92DA7F),
                Color(0xFF40BCA1),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text(
                  AppConfig.langStrings!["Login_Title1"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    height: 1.8,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BlipySignUpPage()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: GradientText(
                      AppConfig.langStrings!["Login_Signup"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.8,
                      ),
                      colors: const <Color>[
                        Color(0xFF92DA7F),
                        Color(0xFF40BCA1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            TextFormField(
              controller: phoneNumber,
              keyboardType: TextInputType.phone,
              cursorWidth: 3,
              cursorHeight: 20,
              cursorColor: const Color(0xFF92DA7F),
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
                border: const OutlineInputBorder(),
                hintText: AppConfig.langStrings!["Phone_Number"],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: password,
              obscureText: isObscure,
              cursorWidth: 3,
              cursorHeight: 20,
              cursorColor: const Color(0xFF92DA7F),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
                border: const OutlineInputBorder(),
                hintText: AppConfig.langStrings!["Password_Password"],
                suffixIcon: IconButton(
                  color: const Color(0xFF92DA7F),
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                      activeColor: const Color(0xFF92DA7F),
                    ),
                    Text(
                      AppConfig.langStrings!["Login_Remember"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 46),
                ElevatedButton(
                  onPressed: () {
                    login(phoneNumber?.text, password?.text);

                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xFF92DA7F),
                            Color(0xFF40BCA1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      child: Text(
                        AppConfig.langStrings!["Login_ButtonOk"],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassPage()),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: GradientText(
                      AppConfig.langStrings!["Login_ForgotPassword"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.8,
                      ),
                      colors: const <Color>[
                        Color(0xFF92DA7F),
                        Color(0xFF40BCA1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
