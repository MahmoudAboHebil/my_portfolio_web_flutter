import 'package:flutter/material.dart';

import '../components/button_color/button_color.dart';
import '../components/side_appbar/side_appbar.dart';
import '../sections/home_section/home_section.dart';

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return Container(
      color: Color(0xfff5f5f4),
      child: Stack(
        alignment: size.width > 1046 ? Alignment.center : Alignment.centerRight,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment:
                size.width > 1046 ? Alignment.center : Alignment.centerRight,
            margin: size.width > 1046
                ? EdgeInsets.only(left: 280)
                : EdgeInsets.only(left: 0),
            width: size.width > 1046 ? 900 : 1200,
            child: HomeSection(),
          ),
          size.width > 1046
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SideAppBar(),
                    ButtonColor(),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
