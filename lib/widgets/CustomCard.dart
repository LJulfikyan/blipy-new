import 'package:blippy_login/Models/feedData.dart';
import 'package:blippy_login/screens/Posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Models/feedItems.dart';

class CustomCard extends StatefulWidget {
   List<FeedItems> feedItems = [];

  CustomCard({Key? key, required this.feedItems}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  AnimationController? ub;
  ScrollController? scrollController;
  int page = 0;
  bool isLoading = false;



  String isInFav(index) {
    FeedItems? feedItem = widget.feedItems[index];
    if (feedItem.favorite!) {
      return './assets/animations/u_b.json';
    } else {
      return './assets/animations/b_u.json';
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, httpResponse) {
        if (widget.feedItems.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }
        return LazyLoadScrollView(
          isLoading: isLoading,
          onEndOfPage: () => scrollListener(),
          child: ListView.builder(
            controller: scrollController,
            itemCount: widget.feedItems.length,
            itemBuilder: (context, index) {
              FeedItems feedItem = widget.feedItems[index];
              return Column(children: [
                Container(
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
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Column(children: [
                          Stack(
                              fit: StackFit.passthrough,
                              alignment: Alignment.bottomLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: Image.network(
                                    feedItem.logoUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                    transform:
                                        Matrix4.translationValues(0, 8, 0),
                                    width: MediaQuery.of(context).size.width *
                                        0.10,
                                    height: MediaQuery.of(context).size.width *
                                        0.10,
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: <Color>[
                                            Color(0xFF92DA7F),
                                            Color(0xFF40BCA1),
                                          ],
                                        )),
                                    child: Text(
                                      feedItem.date!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Roboto",
                                          fontSize: 14),
                                    )),
                              ]),
                          const SizedBox(
                            height: 8,
                          ),
                          Title(
                            color: Colors.black,
                            child: Html(data: feedItem.title!, style: {
                              'body': Style(
                                  fontSize: const FontSize(16),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto')
                            }),
                          ),
                          Html(
                              data: feedItem.contentHtml,
                              onLinkTap:
                                  (link, renderContext, map, element) async {
                                if (link != null && link.isNotEmpty) {
                                  await launchUrlString(link);
                                }
                              },
                              style: {
                                'body': Style(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontSize: const FontSize(16),
                                    color: const Color(0xFF696969)),
                                "a": Style(
                                  color: Colors.green,
                                  fontFamily: 'Roboto',
                                ),
                              }),
                        ]),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 8, 10, 0),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                isInFav(index);
                                ub?.forward();
                              },
                              child: Lottie.asset(isInFav(index),
                                  repeat: false,
                                  controller: ub,
                                  height: 26,
                                  width: 20),
                            )),
                      ],
                    ))
              ]);
            },
          ),
        );
      },
    );
  }



  void scrollListener() async {
      postsPageState.page++;
      FeedData? data = await postsPageState.loadMore(postsPageState.page * 20, 20, postsPageState.isFavourite);
      setState(() {
        widget.feedItems.addAll(data!.items!);
      });

  }
}
