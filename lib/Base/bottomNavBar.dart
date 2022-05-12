import 'package:flutter/material.dart';

import '../profile.dart';
import '../screens/Posts.dart';
import '../screens/notifications.dart';
import 'app_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex = 0;

  final widgets = const [
    PostsPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  final appBarTitle = [
    AppConfig.langStrings?['Feed_Header'],
    AppConfig.langStrings!["Notification_Header"],
    AppConfig.langStrings?['Profile_Header']
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children: widgets,
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        showSelectedLabels: true,
        selectedItemColor: const Color(0xFF40BCA1),
        selectedIconTheme: const IconThemeData.fallback(),
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              './assets/images/PaperActive.png',
            ),
            label: 'Feed',
            icon:  Image.asset(
                './assets/images/Paper.png',
              ),
            ),

          BottomNavigationBarItem(
            activeIcon: Image.asset(
              './assets/images/NotificationActive.png',
            ),
            label: 'Notifications',
            icon:  Image.asset(
                './assets/images/Notificationbar.png',
              ),
            ),

          BottomNavigationBarItem(
              activeIcon: Image.asset(
                './assets/images/Profile.png',
              ),
              label: 'Profile',
              icon:  Image.asset(
                  './assets/images/profile1.png',
                ),
              ),
        ],
      ),);
  }
}
