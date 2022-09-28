import 'dart:convert';
import 'dart:html' as sas;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/theme_changer.dart';

import 'class/Tweet.dart';
import 'hero_tweet.dart';

class DesktopHero extends StatefulWidget {
  const DesktopHero({Key? key}) : super(key: key);

  @override
  State<DesktopHero> createState() => _DesktopHeroState();
}

class _DesktopHeroState extends State<DesktopHero> {
  ScreenshotController screenshotController = ScreenshotController();

  late var nameController = TextEditingController();
  late var usernameController = TextEditingController();

  late var contentController = TextEditingController();
  late var quotesController = TextEditingController();
  late var likesController = TextEditingController();
  late var rtController = TextEditingController();
  late var twitterClientController = TextEditingController();

  late Tweet tweet;
  late Uint8List webProfileImage;
  late Uint8List tweetImage;

  int val = 1;

  @override
  void initState() {
    webProfileImage = Uint8List(8);
    tweetImage = Uint8List(8);

    tweet = Tweet(
        Profile(false, "test", "testNick", File(""), webProfileImage),
        "Tweet Content #hashtag1",
        tweetImage,
        "Tweet Content #hashtag1",
        200,
        50,
        400,
        DateTime.now(),
        "Twitter Web",
        false,
        false,
        false,
        false);

    rtController.text = "400";
    likesController.text = "50";
    quotesController.text = "200";
    nameController.text = "YourName";
    usernameController.text = "@test";
    twitterClientController.text = "Twitter Web";
    contentController.text = "Tweet Content #hastag1";

    nameController.addListener(() {
      setState(() {
        tweet.profile.name = nameController.text;
      });
    });
    usernameController.addListener(() {
      setState(() {
        tweet.profile.username = usernameController.text;
      });
    });
    contentController.addListener(() {
      setState(() {
        tweet.content = contentController.text;
      });
    });

    likesController.addListener(() {
      setState(() {
        tweet.numLikes = int.parse(likesController.text.toString());
      });
    });

    quotesController.addListener(() {
      setState(() {
        tweet.numQuotes = int.parse(quotesController.text.toString());
      });
    });

    rtController.addListener(() {
      setState(() {
        tweet.numRT = int.parse(rtController.text.toString());
      });
    });

    twitterClientController.addListener(() {
      setState(() {
        tweet.platform = twitterClientController.text.toString();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _themeProvider = Provider.of<ThemeChanger>(context);
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SizedBox(height: 75.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(20),
                        color: Colors.orange,
                        onPressed: () => {
                          screenshotController
                              .capture()
                              .then((Uint8List? image) {
                            if (image != null) {
                              final _base64 = base64Encode(image!);
                              final anchor = sas.AnchorElement(
                                  href:
                                      'data:application/octet-stream;base64,$_base64')
                                ..download = "image.png"
                                ..target = 'blank';

                              sas.document.body!.append(anchor);
                              anchor.click();
                              anchor.remove();
                            }
                          }).catchError((onError) {
                            print(onError);
                          })
                        },
                        child: Text("Save Tweet"),
                      ),
                      SizedBox(height: 20,),
                      Screenshot(
                          controller: screenshotController,
                          child: HeroTweet(tweet: tweet)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            const Text("Switch Theme:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white)),
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Light"),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value as int;
                                          _themeProvider.setTheme(lightTheme);
                                        });
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Dark Dim"),
                                    leading: Radio(
                                      value: 2,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value as int;
                                          _themeProvider.setTheme(darkTheme);
                                        });
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Dark Lights out"),
                                    leading: Radio(
                                      value: 3,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value as int;
                                        });
                                        _themeProvider
                                            .setTheme(darkLightsOutTheme);
                                      },
                                      activeColor: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Profile:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Profile Image:",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                child: Text("Choose File"),
                                onPressed: () async {
                                  _pickImage(0);
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Name'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Username'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CheckboxListTile(
                            title: Text("Verified user"),
                            value: tweet.profile.verified,
                            onChanged: (newValue) {
                              setState(() {
                                tweet.profile.verified = newValue!;
                              });
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Tweet Content:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: contentController,
                          minLines: 3,
                          maxLines: 6,
                          maxLength: 280,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Tweet Content'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CheckboxListTile(
                                  title: Text("You RT"),
                                  value: tweet.youRT,
                                  onChanged: (newValue) {
                                    setState(() {
                                      tweet.youRT = newValue!;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: CheckboxListTile(
                                  title: Text("You Liked"),
                                  value: tweet.youLiked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      tweet.youLiked = newValue!;
                                    });
                                  }),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Image:",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                child: Text("Choose File"),
                                onPressed: () async {
                                  _pickImage(1);
                                }),
                            Visibility(
                                visible: tweetImage.length != 8,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          print("clearImage");
                                          tweetImage = Uint8List(8);
                                          tweet.image = Uint8List(8);
                                        });
                                      },
                                      child: const Text(
                                        "Clear image",
                                        style: TextStyle(color: Colors.blue),
                                      ),

                                    ),

                                  ],
                                )),
                            Visibility(
                              visible: tweetImage.length != 8,
                              child: Expanded(
                                child: CheckboxListTile(
                                    title: Text("Is Video"),
                                    value: tweet.isVideo,
                                    onChanged: (newValue) {
                                      setState(() {
                                        tweet.isVideo = newValue!;
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: rtController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Num RT'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: quotesController,
                                decoration: const InputDecoration(
                                  label: Text('Num Quotes'),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: likesController,
                                decoration: const InputDecoration(
                                  label: Text('Num Likes'),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: twitterClientController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Tweeter Client'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Date:",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                child: Text("Select Date"),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      //get today's date
                                      firstDate: DateTime(2000),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    setState(() {
                                      tweet.date = pickedDate;
                                    });
                                  }
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Visibility(
                          visible: false,
                          child: CheckboxListTile(
                              title: Text("Twitter Circle"),
                              value: tweet.circle,
                              onChanged: (newValue) {
                                setState(() {
                                  tweet.circle = newValue!;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(int imageId) async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);
        setState(() {
          //_pickedImage = selected;
          if (imageId == 0) {
            tweet.profile.image = selected;
          } else if (imageId == 1) {}
        });
      } else {
        print('No image has been picked.');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = await image.readAsBytes();
        setState(() {
          if (imageId == 0) {
            webProfileImage = selected;
            tweet.profile.image2 = webProfileImage;
          } else if (imageId == 1) {
            tweetImage = selected;
            tweet.image = selected;
          }
        });
      }
    }
  }
}
