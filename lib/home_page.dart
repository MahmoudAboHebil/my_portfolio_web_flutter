import 'package:flutter/material.dart';
import 'package:portfolio_2/layout/desktop_layout.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(),
      // drawer: MyDrawer(),

      body: DesktopLayout(),
    );
  }
}
