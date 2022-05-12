import 'package:blippy_login/screens/sign_up_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Base/app_config.dart';
import '../Base/call_api.dart';
import '../Models/phoneNumber.dart';
import '../main.dart';

class BlipySignIn extends StatelessWidget {
  const BlipySignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlipySignUpPage(title: 'SIGN_IN'),
    );
  }
}

class BlipySignUpPage extends StatefulWidget {
  const BlipySignUpPage({Key? key, required String title}) : super(key: key);



  @override
  State<BlipySignUpPage> createState() => BlipySignUpPageState();
}


class BlipySignUpPageState extends State<BlipySignUpPage> {

  static String number  = "";


   sendCode( number) async {
    PhoneNumber phoneNumber = PhoneNumber(number);
    var httpResponse = await CallApi.getRestClient().sendCode(phoneNumber);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  BlipySignUpSMSPage(
              title: 'SMS',
              validId: httpResponse?.data?.validationId,
              code: httpResponse?.data?.code,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Text(AppConfig.langStrings!["Login_Signup"]),
            const Spacer(),
            const Text('1/3')
          ],
        ),
        automaticallyImplyLeading: false,
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
            const SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Text(
                  AppConfig.langStrings!["Signup_Title1"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BlippyLoginPage(title: 'Sign_in')));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: GradientText(
                      AppConfig.langStrings!["Signup_Signup"],
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
              onChanged: (text) {
                number = text;
              },
              autofocus: true,
              initialValue: AppConfig.countryCodeData?.countryCallingCode,
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
              height: 50,
            ),
            Column(
              children: [
                const SizedBox(height: 46),
                ElevatedButton(
                  onPressed: ()  {
                    sendCode(number);

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
                        AppConfig.langStrings!["Signup_ButtonContinue"],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const Spacer(),
            Html(
                data: '<div id="mainWrapper">' +
                    AppConfig.langStrings!["Signup_Footer1"] +
                    '<div>',
                onLinkTap: (link, renderContext, map, element) async {
                  if (link != null && link.isNotEmpty) {
                    await launch(link);
                  }
                },
                style: {
                  "a": Style(
                    color: Colors.green,
                    fontFamily: 'Roboto',
                  ),
                  "#mainWrapper": Style(
                    textAlign: TextAlign.center,
                  )
                }),
            const SizedBox(
              height: 34,
            )
          ],
        ),
      ),
    );
  }
}
