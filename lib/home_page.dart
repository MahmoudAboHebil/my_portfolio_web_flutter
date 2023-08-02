import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/side_appbar_section/side_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      // appBar: MyAppBar(),
      // drawer: MyDrawer(),

      body: Container(
        child: Column(
          children: [
            Expanded(child: SideAppBar()),
          ],
        ),
      ),
    );
  }
}
