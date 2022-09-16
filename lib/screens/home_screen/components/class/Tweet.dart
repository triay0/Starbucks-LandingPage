import 'dart:io';

import 'package:flutter/services.dart';

class Tweet {

  Profile profile;
  String content;
  String translation;
  int numLikes;
  int numRT;
  DateTime date;
  String platform;
  bool circle;

  Tweet(this.profile,
      this.content,
      this.translation,
      this.numLikes,
      this.numRT,
      this.date,
      this.platform,
      this.circle);
}

class Profile {
  bool verified;
  String username;
  String name;
  File image;
  Uint8List image2;

  Profile(this.verified,
      this.username,
      this.name,
      this.image,
      this.image2);
}