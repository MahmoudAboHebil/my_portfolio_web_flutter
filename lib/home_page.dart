import 'package:flutter/material.dart';
import 'package:portfolio_2/layout/desktop_layout.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(),
      // drawer: MyDrawer(),
      backgroundColor: Color(0xfff5f5f4),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return DesktopLayout();

          // if (constraints.maxWidth > 1200) {
          //   // web
          //   return DesktopLayout();
          // } else if (constraints.maxWidth > 800 &&
          //     constraints.maxWidth < 1200) {
          //   // tablet
          //   return Container(
          //     child: Column(
          //       children: [
          //         Expanded(
          //           child: MyAppBar(),
          //         ),
          //       ],
          //     ),
          //   );
          // } else {
          //   // mobile
          //   return SizedBox();
          // }
        },
      ),
    );
  }
}
