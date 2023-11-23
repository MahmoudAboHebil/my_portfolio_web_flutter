import 'package:flutter/material.dart';
import 'package:portfolio_2/locator.dart';

import 'home_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: MaterialStateProperty.all(true),
              thickness: MaterialStateProperty.all(10),
              radius: const Radius.circular(10),
              minThumbLength: 100)),
      home: HomePage(),
    );
  }
}
