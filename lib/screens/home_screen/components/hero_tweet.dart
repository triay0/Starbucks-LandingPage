import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/utils.dart';

import 'class/Tweet.dart';

class HeroTweet extends StatefulWidget {
  Tweet tweet;

  HeroTweet({required Tweet this.tweet, Key? key}) : super(key: key);

  @override
  State<HeroTweet> createState() => _HeroTweetState();
}

class _HeroTweetState extends State<HeroTweet> {
  String content = "";

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //text.children.clear();

    print(widget.tweet.profile.image2);

    return Container(
      width: MediaQuery.of(context).size.width * .3,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.grey)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Visibility(
                visible: widget.tweet.profile.image2.length == 8,
                child: Container(
                  width: 48,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://abs.twimg.com/sticky/default_profile_images/default_profile_bigger.png'),
                  ),
                ),
              ),
              Visibility(
                  visible: widget.tweet.profile.image2.length != 8,
                  child: Container(
                    width: 48,
                    child: CircleAvatar(
                        backgroundImage:
                            MemoryImage(widget.tweet.profile.image2)),
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        widget.tweet.profile.name,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Chirp',
                        ),
                      ),
                      Visibility(
                          visible: widget.tweet.profile.verified,
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              "images/verified.svg",
                              color: Colors.blue,
                            ),
                          ))
                    ],
                  ),
                  AutoSizeText(
                    widget.tweet.profile.username,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontFamily: 'Chirp',
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: Colors.grey,
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            buildTweetContent(widget.tweet.content),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: widget.tweet.image.length != 8,
                child: Stack(
                    // fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            // Image border
                            child: Image.memory(widget.tweet.image)),
                      ),
                      Visibility(
                        visible: widget.tweet.isVideo,
                        child: Center(
                          child: Image.asset(
                            'assets/images/play_video.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ])),
            const AutoSizeText(
              "Translate Tweet",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13.0,
                fontFamily: 'Chirp',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Row(
                children: [
                  Text(DateFormat('h:m a · MMM d, yyyy')
                      .format(widget.tweet.date)),
                  const Text(' · '),
                  Text(widget.tweet.platform)
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                children: [
                  Visibility(
                    visible:
                        widget.tweet.numRT != 0 && !widget.tweet.numRT.isNaN,
                    child: Row(
                      children: [
                        Text(
                          widget.tweet.numRT.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Chirp',
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: const Text("Retweets")),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.tweet.numQuotes != 0 &&
                        !widget.tweet.numQuotes.isNaN,
                    child: Row(
                      children: [
                        Text(
                          widget.tweet.numQuotes.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Chirp'),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: const Text("Quote Tweets")),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.tweet.numLikes != 0 &&
                        !widget.tweet.numLikes.isNaN,
                    child: Row(
                      children: [
                        Text(
                    Utils.formatNum(widget.tweet.numLikes),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: const Text(
                              "Likes",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Chirp',
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 0.1,
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                      child: SvgPicture.asset(
                    "images/comment.svg",
                    color: Colors.blueGrey,
                  )),
                  Expanded(
                      child: SvgPicture.asset(
                    widget.tweet.youRT
                        ? "images/rt_pressed.svg"
                        : "images/rt.svg",
                  )),
                  Expanded(
                      child: SvgPicture.asset(
                    widget.tweet.youLiked
                        ? "images/like_pressed.svg"
                        : "images/like.svg",
                    //semanticsLabel: 'Acme Logo'
                  )),
                  Expanded(
                      child: SvgPicture.asset("images/share.svg",
                          color: Colors.blueGrey, semanticsLabel: 'Acme Logo')),
                ],
              ),
            ),
            Visibility(
                visible: widget.tweet.circle,
                child: Container(
                  color: Colors.green[100],
                  child: ListTile(
                    leading: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Colors.green[800],
                      child: SvgPicture.asset(
                        "images/twitter_circle.svg",
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                    ),
                    title: Text(
                      'Only people in ${widget.tweet.profile.username}’s Twitter Circle can see this Tweet',
                    ),
                  ),
                ))
          ]),
    );
  }

  Widget buildTweetContent(String text) {
    var pattern = RegExp(
        "#([A-Za-z0-9_-]+)|@([A-Za-z0-9_-]+)|^(?:https?:\\\\)?(?:www\\.)?[a-zA-Z0-9.]+\$");

    List<InlineSpan> list = [];

    final words = text.split(' ');

    final matches = pattern.allMatches(text).map((m) => m.group(0)).toString();

    print("allMatches : $matches");

    for (var word in words) {
      //  print(word);
      if (matches.contains(word)) {
        list.add(TextSpan(
            text: word + " ", style: const TextStyle(color: Colors.blue)));
      } else {
        list.add(TextSpan(
            text: word + " ",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Chirp',
              color: Theme.of(context).textTheme.bodyText1!.color!,
            )));
      }
    }
    var text2 = RichText(
      text: TextSpan(
          text: '', style: const TextStyle(fontSize: 20), children: list),
    );
    return text2;
  }
}
