import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/button_color_section/button_color.dart';

import '../sections/home_section/home_section.dart';
import '../sections/side_appbar_section/side_appbar.dart';

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideAppBar(),
          HomeSection(),
          ButtonColor(),
        ],
      ),
    );
  }
}
