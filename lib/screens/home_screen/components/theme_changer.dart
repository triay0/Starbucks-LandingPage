
import 'package:flutter/material.dart';


var darkLightsOutTheme =  ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  // Define the default font family.
  fontFamily: 'Georgia',
  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  cardColor: Color.fromRGBO(0, 0, 0, 1.0),
  selectedRowColor: Colors.white,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold,color: Colors.white),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic,color: Colors.white),
    bodyText1: TextStyle(fontSize: 14.0,color: Colors.white),
    bodyText2: TextStyle(fontSize: 14.0,color: Colors.white),
  ),
);

var darkTheme =  ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  // Define the default font family.
  fontFamily: 'Georgia',
  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  cardColor: Color.fromRGBO(21, 32, 43, 1.0),
  selectedRowColor: Colors.white,

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold,color: Colors.white),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic,color: Colors.white),
    bodyText1: TextStyle(fontSize: 14.0,color: Colors.white),
    bodyText2: TextStyle(fontSize: 14.0,color: Colors.white),
  ),
);

var lightTheme=  ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  // Define the default font family.
  fontFamily: 'Georgia',
  cardColor: Color.fromRGBO(255, 255, 255, 1.0),
  selectedRowColor: Colors.blue,

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 14.0,color: Colors.black),
    bodyText2: TextStyle(fontSize: 14.0,color: Colors.black),
  ),
);

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  get getTheme => _themeData;
  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
