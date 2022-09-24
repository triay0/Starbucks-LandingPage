import 'dart:io';

import 'package:flutter/services.dart';

class Tweet {

  Profile profile;
  String content;
  String translation;
  int numLikes;
  int numQuotes;
  int numRT;
  DateTime date;
  String platform;
  bool circle;
  bool youLiked;
  bool youRT;
  Uint8List image;
  bool isVideo;

  Tweet(this.profile,
      this.content,
      this.image,
      this.translation,
      this.numLikes,
      this.numQuotes,
      this.numRT,
      this.date,
      this.platform,
      this.circle,
      this.youLiked,
      this.youRT,
      this.isVideo);
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