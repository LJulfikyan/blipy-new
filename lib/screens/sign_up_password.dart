import 'dart:core';
import 'package:blippy_login/Base/LanguageRequest.dart';
import 'package:blippy_login/profile.dart';
import 'package:blippy_login/screens/sign_up_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Base/app_config.dart';
import '../Base/blippy_utils.dart';

class SignUpPassword extends StatefulWidget {
   int? validationId;
   SignUpPassword({Key? key, this.validationId}) : super(key: key);

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  bool isObscure = true;
  bool isValidPhone = false;
  bool passMatch = false;
  bool atLeastEight = false;
  bool containNums = false;
  bool isButtonActive = false;
  late String text1 = "";
  late String text2 = "";
  late ElevatedButton continueButton;
   late String password = "";




  void checkLength(String text) {
    if (text.length >= 8) {
      setState(() {
        atLeastEight = true;
      });
    } else {
      setState(() {
        atLeastEight = false;
      });
    }
  }

  TextEditingController passwordController = TextEditingController();

  void isContainNumber(String text) {
    if (text.contains(RegExp(r'[0-9]'))) {
      setState(() {
        containNums = true;
      });
    } else {
      setState(() {
        containNums = false;
      });
    }
  }

  void passwordMatch(String text1, String text2) {
    if (text1 == text2 &&
        text1.isNotEmpty &&
        text2.isNotEmpty &&
        atLeastEight &&
        containNums) {
      setState(() {
        passMatch = true;
      });
    } else {
      setState(() {
        passMatch = false;
      });
    }
  }

  void correctForm() {
    if (containNums && atLeastEight && passMatch) {
      setState(() {
        isButtonActive = true;
      });
    } else {
      setState(() {
        isButtonActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppConfig.langStrings!["Login_Signup"]),
            const Spacer(),
            const Text('3/3')
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
            Row(
              children: <Widget>[
                Text(
                  AppConfig.langStrings!['''Password_Footer4'''],
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    height: 1.8,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]'))
              ],
              onChanged: (text) {
                text1 = text;
                checkLength(text1);
                isContainNumber(text1);
                passwordMatch(text1, text2);
                correctForm();
              },
              obscureText: isObscure,
              cursorWidth: 3,
              cursorHeight: 20,
              cursorColor: const Color(0xFF92DA7F),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
                border: const OutlineInputBorder(),
                hintText: AppConfig.langStrings!["Password_New"],
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
              height: 15,
            ),
            TextField(
              controller: passwordController,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]'))
              ],
              onChanged: (text) {
                text2 = text;
                passwordMatch(text1, text2);
                correctForm();
              },
              obscureText: isObscure,
              cursorWidth: 3,
              cursorHeight: 20,
              cursorColor: const Color(0xFF92DA7F),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
                border: const OutlineInputBorder(),
                hintText: AppConfig.langStrings!["Password_Confirm"],
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
              height: 14,
            ),
            Column(
              children: [
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: atLeastEight ? Colors.green : Colors.grey),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                    ),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    AppConfig.langStrings!["Password_Footer1"],
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      height: 1.8,
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: containNums ? Colors.green : Colors.grey),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      AppConfig.langStrings!["Password_Footer2"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: passMatch ? Colors.green : Colors.grey),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      AppConfig.langStrings!["Password_Footer3"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                continueButton = ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isButtonActive = true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                        BlipyUtils.createUser(widget.validationId,BlipySignUpPageState.number,passwordController.text,LanguageRequest('en'));
                      } else {
                        null;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: isButtonActive
                                ? <Color>[
                                    const Color(0xFF92DA7F),
                                    const Color(0xFF40BCA1),
                                  ]
                                : <Color>[
                                    const Color(0xFF92DA7F).withOpacity(0.5),
                                    const Color(0xFF40BCA1).withOpacity(0.5)
                                  ]),
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      child: Text(
                        AppConfig.langStrings!["Signup_ButtonOk"],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
