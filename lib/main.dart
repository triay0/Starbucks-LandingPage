
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/theme_changer.dart';

import './screens/screens.dart';
import 'package:url_strategy/url_strategy.dart';


void main() {
  setPathUrlStrategy();

  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(lightTheme),
        ),
      ],
      child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot){
            if(snapshot.hasError){
              print("Error");
            }
            if(snapshot.connectionState == ConnectionState.done){
              return MaterialAppWithTheme();
            }
            return CircularProgressIndicator();
          },
      )
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
