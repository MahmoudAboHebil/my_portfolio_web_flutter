import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/appbar_section/appbar.dart';
import 'package:portfolio_2/sections/side_appbar_section/side_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      // appBar: MyAppBar(),
      // drawer: MyDrawer(),

      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            // web
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: SideAppBar(),
                  ),
                ],
              ),
            );
          } else if (constraints.maxWidth > 800 &&
              constraints.maxWidth < 1200) {
            // tablet
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: MyAppBar(),
                  ),
                ],
              ),
            );
          } else {
            // mobile
            return SizedBox();
          }
        },
      ),
    );
  }
}
// constraints.maxWidth > 800 && constraints.maxWidth < 1200)
