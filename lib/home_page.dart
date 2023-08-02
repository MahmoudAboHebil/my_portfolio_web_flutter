import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/appbar_section/appbar.dart';
import 'package:portfolio_2/sections/draw_section/drawer_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Container(
        height: 100,
        color: Colors.redAccent,
      ),
    );
  }
}
