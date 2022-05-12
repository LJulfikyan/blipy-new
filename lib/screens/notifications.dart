import 'package:blippy_login/Base/blippy_utils.dart';
import 'package:blippy_login/Models/notificationRequest.dart';
import 'package:blippy_login/Models/notificationsModel.dart';
import 'package:blippy_login/screens/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../Base/app_config.dart';
import 'package:blippy_login/Models/notificationList.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int page = 0;
  NotificationList? notificationList;

  @override
  void initState() {
    super.initState();
    getMyNotifications(page * 20, 20);
  }

  Future<void> getMyNotifications(
    int skip,
    int take,
  ) async {
    NotificationRequest request = NotificationRequest(skip, take);
    notificationList = await BlipyUtils.getNotifications(request);
    setState(() {});
  }

  Widget hasPost(index) {
    if (notificationList?.items![index].postId != null) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  PostDetails(id: notificationList?.items![index].postId)),
            );
          },
          child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFEFF9F4),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              alignment: Alignment.center,
              height: 32,
              width: MediaQuery.of(context).size.width,
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: MediaQuery.of(context).size.width,
                child: GradientText(
                  "See Post",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                  colors: const [
                    Color(0xFF92DA7F),
                    Color(0xFF40BCA1),
                  ],
                ),
              )));
    } else {
      return Container();
    }
  }

  Widget notificationCard() {
    return FutureBuilder(builder: (context, httpResponse) {
      if (notificationList == null) {
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      }
      return RefreshIndicator(
          color: Colors.green,
          onRefresh: () async{
          page = 0;
       await getMyNotifications(page * 20, 20);
      },
      child: ListView.builder(
        itemCount: notificationList?.items?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          NotificationItem? notification = notificationList?.items![index];
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                './assets/images/Calendar.png',
                              ),
                              const SizedBox(width: 4),
                              GradientText(
                                notification!.date!,
                                colors: const <Color>[
                                  Color(0xFF92DA7F),
                                  Color(0xFF40BCA1),
                                ],
                              )
                            ],
                          ),
                          Html(data: notification.contentHtml),
                        ],
                      ),
                    ),
                    hasPost(index)
                  ]))
            ],
          );
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(AppConfig.langStrings!["Notification_Header"]),
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
      body: notificationCard(),
    );
  }
}
