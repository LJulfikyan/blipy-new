import 'package:blippy_login/Base/blippy_utils.dart';
import 'package:blippy_login/Models/feedItems.dart';
import 'package:flutter/material.dart';
import '../Base/app_config.dart';
import '../widgets/CustomCard.dart';

class PostDetails extends StatefulWidget {
  int? id;

  PostDetails({Key? key, this.id}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}


class _PostDetailsState extends State<PostDetails> {

  List<FeedItems>? feedItems = [];

  @override
   void initState() {
    super.initState();
    getPostDetail();
  }

  Future<void> getPostDetail() async {
    FeedItems item = await BlipyUtils.getPostDetails(widget.id);
    feedItems?.add(item);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: CustomCard(feedItems: feedItems!),
    );
  }
}
