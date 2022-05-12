import 'package:blippy_login/Base/app_config.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(AppConfig.langStrings?['Profile_Header']),
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
        body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            children: [
              Column(children: [
                const SizedBox(
                  height: 36,
                ),
                GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        const ExactAssetImage('./assets/images/eclipse_74.png'),
                    radius: 54,
                    child: Image.asset(
                      './assets/images/image1.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                GestureDetector(
                    child: GradientText(
                  AppConfig.langStrings?['Profile_AddPhoto'],
                  colors: const <Color>[
                    Color(0xFF92DA7F),
                    Color(0xFF40BCA1),
                  ],
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                )),
                const SizedBox(
                  height: 24,
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.45),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(children: [
                  ListTile(
                    trailing: CircleAvatar(
                      radius: 10,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/rectangle.png'),
                      child: Image.asset('./assets/images/Right.png'),
                    ),
                    leading: CircleAvatar(
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/Ellipse 75.png'),
                      child: Image.asset('./assets/images/Subtract.png'),
                    ),
                    style: ListTileStyle.drawer,
                    title: Text(
                      AppConfig.langStrings!['Profile_Language'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: const Text(
                      'palmeiro.leonardo@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: CircleAvatar(
                      radius: 10,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/rectangle.png'),
                      child: Image.asset('./assets/images/Right.png'),
                    ),
                    leading: CircleAvatar(
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/Ellipse 75.png'),
                      child: Image.asset('./assets/images/Call.png'),
                    ),
                    title: Text(
                      AppConfig.langStrings!['Phone_Number'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      AppConfig.langStrings!['Profile_Notifications'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: CircleAvatar(
                      radius: 10,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/rectangle.png'),
                      child: Image.asset('./assets/images/Right.png'),
                    ),
                    leading: CircleAvatar(
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/Ellipse 75.png'),
                      child: Image.asset('./assets/images/notification.png'),
                    ),
                    title: Text(
                      AppConfig.langStrings!['Profile_Notifications'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: CircleAvatar(
                      radius: 10,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/rectangle.png'),
                      child: Image.asset('./assets/images/Right.png'),
                    ),
                    leading: CircleAvatar(
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const ExactAssetImage(
                          './assets/images/Ellipse 75.png'),
                      child: Image.asset('./assets/images/Lock.png'),
                    ),
                    selected: isSelected,
                    enabled: true,
                    selectedColor: const Color(0xFFF6F5FA),
                    onTap: () {},
                    title: Text(
                      AppConfig.langStrings!['Profile_ChangePassword'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 28,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(AppConfig.langStrings!['Profile_Logout']),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xFFD0CDDA).withOpacity(0.4))),
              ),
              const SizedBox(
                height: 14,
              ),
              Center(
                  child: Text(
                AppConfig.langStrings!['Profile_Version'] + ': ' + '4.1.004',
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              )),
              const SizedBox(height: 10,)
            ]));

  }
}
