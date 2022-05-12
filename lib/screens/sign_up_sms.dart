import 'package:blippy_login/Models/validation_request.dart';
import 'package:blippy_login/screens/sign_up_password.dart';
import 'package:blippy_login/screens/sign_up_phone.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../Base/app_config.dart';
import '../Base/call_api.dart';

class BlippySignUpSMS extends StatelessWidget {
  const BlippySignUpSMS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class BlipySignUpSMSPage extends StatefulWidget {
  final int? validId;

  const BlipySignUpSMSPage({
    Key? key,
    required this.validId,
    String? title,
    int? code,
  }) : super(key: key);

  @override
  State<BlipySignUpSMSPage> createState() => _BlipySignUpSMSPageState();
}

class _BlipySignUpSMSPageState extends State<BlipySignUpSMSPage> {
  _BlipySignUpSMSPageState();

  TextEditingController otpController = TextEditingController();
  String currentText = "";

  validateCode() async {
    var code = int.parse(otpController.text);
    ValidationRequest request = ValidationRequest(widget.validId, code);
    var httpResponse = await CallApi.getRestClient().validateCode(request);
    if (httpResponse?.status == 'ok' &&
        httpResponse?.data != null &&
        httpResponse?.data?.code == request.code &&
        httpResponse?.data?.validationId == request.validationId) {

      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  SignUpPassword(validationId: widget.validId, )));
      return httpResponse?.data;
    }
    else {
      otpController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Text(AppConfig.langStrings!["SmsVer_Header"]),
            const Spacer(),
            const Text('2/3')
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
            Row(children: <Widget>[
              Flexible(
                child: Text(
                  AppConfig.langStrings!["SmsVer_Title1"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
            Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  AppConfig.langStrings!["SmsVer_Description1"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF696969),
                  ),
                ),
                Text(
                  BlipySignUpPageState.number,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Form(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        onChanged: (String value) {},
                        controller: otpController,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 46,
                          fieldWidth: 46,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          selectedColor: const Color(0xFF92DA7F),
                          inactiveColor: Colors.transparent,
                          activeColor: const Color(0xFF92DA7F),
                          inactiveFillColor: const Color(0x8892DA7F),
                        ),
                        cursorColor: Colors.green,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color(0x6B40BC82),
                            blurRadius: 3,
                          ),
                          BoxShadow(color: Colors.white)
                        ],
                        onCompleted: (v) {
                          setState(() {
                            validateCode();

                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                      child: Row(children: [
                        IconButton(
                          onPressed: () {
                            // BlippyUtils.sendCode(BlippySign_upPageState.number );
                          },
                          icon: Image.asset(
                            './assets/images/Resend.png',
                          ),
                        ),
                        GradientText(
                          AppConfig.langStrings!['SmsVer_Resent'],
                          colors: const <Color>[
                            Color(0xFF92DA7F),
                            Color(0xFF40BCA1),
                          ],
                        ),
                      ]),
                      onTap: () {
                        // BlippyUtils.sendCode(BlippySign_upPageState.number );
                      }),
                  const SizedBox(
                    width: 26,
                  )
                ]),
              ],
            ),
            Spacer(),
            GestureDetector(
              child: GradientText(
                AppConfig.langStrings!['SmsVer_ChangeMobile'],
                colors: const <Color>[
                  Color(0xFF92DA7F),
                  Color(0xFF40BCA1),
                ],
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 72,
            )
          ],
        ),
      ),
    );
  }
}
