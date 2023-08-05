import 'package:flutter/material.dart';

import '../components/button_color/button_color.dart';
import '../components/side_appbar/side_appbar.dart';
import '../sections/home_section/home_section.dart';

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
