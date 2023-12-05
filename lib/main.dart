import 'package:flutter/material.dart';
import 'package:portfolio_2/locator.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/routing/router.dart';
import 'package:portfolio_2/services/navigtion_service.dart';

import 'constants.dart';
import 'home_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,

      // theme: ThemeData(scaffoldBackgroundColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: MaterialStateProperty.all(true),
              thickness: MaterialStateProperty.all(10),
              radius: const Radius.circular(10),
              minThumbLength: 100)),
      builder: (context, child) {
        return HomePage(child!);
      },
      onGenerateRoute: generateRoute,
      initialRoute: ContactRoute,
    );
  }
}
