
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/theme_changer.dart';

import './screens/screens.dart';
import 'package:url_strategy/url_strategy.dart';


void main() {
  setPathUrlStrategy();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(lightTheme),
        ),
      ],
      child: MaterialAppWithTheme()
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TweetGen",
      theme: theme.getTheme,
      home: HomeScreen(),
    );
  }
}
