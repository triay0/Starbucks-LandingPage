
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/theme_changer.dart';

import './screens/screens.dart';

void main() {
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
      theme: theme.getTheme,
      home: HomeScreen(),
    );
  }
}
