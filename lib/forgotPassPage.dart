import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Base/app_config.dart';
import 'confirmPassChange.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  bool isObscure = true;
  bool isValidPhone = false;
  bool passMatch = false;
  bool atLeastEight = false;
  bool containNums = false;
  bool isButtonActive = false;
  late String text1 = "";
  late String text2 = "";

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
            Text(AppConfig.langStrings!["ForgotPassword_Header"]),
            const Spacer(),
            const Text('1/2')
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
                  AppConfig.langStrings!['''ForgotPassword_Title1'''],

                  maxLines: 2,
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
                onChanged: (phoneNum) {
                  print(phoneNum);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[+0-9]'))
                ],
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
                )),
            const SizedBox(
              height: 15,
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
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isButtonActive
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ConfirmPassChange()),
                            )
                          : null;
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
                        AppConfig.langStrings!["ForgotPassword_ButtonOk"],
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
