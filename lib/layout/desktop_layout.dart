import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';

import '../components/button_color/button_color.dart';
import '../components/custom_appbar/custom_appbar.dart';
import '../components/side_appbar/side_appbar.dart';
import '../sections/home_section/home_section.dart';

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return Container(
      color: Color(0xfff5f5f4),
      alignment:
          size.width > 1046 ? Alignment.centerRight : Alignment.topCenter,
      child: Stack(
        alignment: size.width > 1046 ? Alignment.center : Alignment.centerRight,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                !(size.width > 1046) ? CustomAppBar() : SizedBox(),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: 485,
                  ),
                  duration: Duration(seconds: 1),
                  alignment: size.width > 1046
                      ? Alignment.centerRight
                      : Alignment.center,
                  margin: size.width > 1046
                      ? EdgeInsets.only(left: 280)
                      : EdgeInsets.only(left: 0),
                  width: size.width > 1046 ? 900 : 775,
                  child: AboutSection(size),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          size.width > 1046
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SideAppBar(),
                    ButtonColor(false),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
