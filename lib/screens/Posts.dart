import 'package:blippy_login/Models/feedData.dart';
import 'package:blippy_login/Models/postRequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Base/app_config.dart';
import '../Base/blippy_utils.dart';
import '../widgets/CustomCard.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => PostsPageState();
}

class PostsPageState extends State<PostsPage> with TickerProviderStateMixin {
  late bool isFavourite = false;
  late AnimationController _controller;
  AnimationController? ub;
  FeedData? feedData ;
  int page = 0;

  @override
  void initState() {
    super.initState();
    getMyPosts(page * 20, 20, isFavourite);
    ub = AnimationController(
      vsync: this,
    );
    _controller = AnimationController(
      vsync: this,
    );

  }

  Future<void> getMyPosts(int skip, int take, bool fav) async {
    PostRequest request = PostRequest(skip, take, fav);
    feedData = AppConfig.feedItems = await BlipyUtils.getFeedItems(request);
    setState(() {

    });
  }

  Future<FeedData?> loadMore(int skip, int take, bool fav) async {
    PostRequest request = PostRequest(skip, take, fav);
    FeedData? data = await BlipyUtils.getFeedItems(request);
    feedData?.items?.addAll(data!.items!);
    return data;
  }

  String favLottie() {
    if (!isFavourite) {
      return './assets/animations/u_b.json';
    } else {
      return './assets/animations/b_u.json';
    }
  }



  void updateLottie() {
    _controller.reset();
    _controller.forward();
    _controller.addStatusListener((status)  {
      if(status == AnimationStatus.completed){
        setState(() {});
        isFavourite = !isFavourite;


      }
    });



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(AppConfig.langStrings?['Feed_Header']),
            const Spacer(),
            GestureDetector(
              child: SizedBox(
                width: 20,
                height: 25,
                child: Lottie.asset(
                  favLottie(),
                  repeat: true,
                  animate: true,
                  reverse: false,
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;

                  },
                ),
              ),
              onTap: () {
                    updateLottie();
                    getMyPosts(page * 20, 20, isFavourite);
              },
            )
          ],
        ),
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
      body: RefreshIndicator(
        color: Colors.green,
        onRefresh: () async {
          page = 0;
          await getMyPosts(page * 20, 20, isFavourite);
        },
        child: CustomCard(feedItems: feedData != null ? feedData!.items! : []),
      ),
    );
  }
}


PostsPageState postsPageState = PostsPageState();