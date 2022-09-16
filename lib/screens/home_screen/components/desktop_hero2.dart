import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/theme_changer.dart';

import 'app_themes.dart';
import 'class/Tweet.dart';
import 'hero_tweet.dart';

class DesktopHero extends StatefulWidget {
  const DesktopHero({Key? key}) : super(key: key);

  @override
  State<DesktopHero> createState() => _DesktopHeroState();
}

class _DesktopHeroState extends State<DesktopHero> {

  late var nameController = TextEditingController();
  late var usernameController = TextEditingController();

  late var contentController = TextEditingController();
  late var likesController = TextEditingController();
  late var rtController = TextEditingController();
  late var twitterClientController = TextEditingController();

  late Tweet tweet;
  late Uint8List webImage;
  int val = -1;


  @override
  void initState() {
    webImage = Uint8List(8);

    tweet = Tweet(
        Profile(false, "test", "testNick", File(""), webImage),
        "Tweet Content #hashtag1",
        "Tweet Content #hashtag1",
        50,
        400,
        DateTime.now(),
        "Twitter Web",
        false);
    rtController.text = "400";
    likesController.text = "50";
    nameController.text = "50";
    usernameController.text = "50";
    twitterClientController.text = "Twitter Web";

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
    var _themeProvider=Provider.of<ThemeChanger>(context);
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: HeroTweet(tweet: tweet),
                ),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
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
                              activeColor: Colors.green,
                            ),
                          ),
                          ListTile(
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
                              activeColor: Colors.green,
                            ),
                          ),
                          ListTile(
                            title: Text("Dark Lights out"),
                            leading: Radio(
                              value: 3,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value as int;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Text("Profile Image"),
                      ElevatedButton(
                          child: Text("Choose File"),
                          onPressed: () async {
                            _pickImage();
                          }),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Name'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Username'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 10,
                      ),
                      TextField(
                        controller: likesController,
                        decoration: const InputDecoration(
                          label: Text('Num Likes'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: rtController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Num RT'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: contentController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Tweet Content'),
                        ),
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
                      ElevatedButton(
                          child: Text("date"),
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
                      const SizedBox(
                        height: 10,
                      ),
                      CheckboxListTile(
                          title: Text("Twitter Circle"),
                          value: tweet.circle,
                          onChanged: (newValue) {
                            setState(() {
                              tweet.circle = newValue!;
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);
        setState(() {
          //_pickedImage = selected;
          tweet.profile.image = selected;
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
          webImage = selected;
          //_pickedImage = File("a");
          tweet.profile.image2 = webImage;
        });
      }
    }
  }
}
