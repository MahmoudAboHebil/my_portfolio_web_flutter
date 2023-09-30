import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';

import '../components/button_color/button_color.dart';
import '../components/custom_appbar/custom_appbar.dart';
import '../components/side_appbar/side_appbar.dart';

class DesktopLayout extends StatefulWidget {
  ScrollController _controller;

  DesktopLayout(this._controller);
  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  ScrollController yourScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return Container(
      color: Color(0xfff5f5f4),
      alignment:
          size.width > 1046 ? Alignment.centerRight : Alignment.topCenter,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ListView(
            primary: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                alignment: size.width > 1046
                    ? Alignment.center
                    : Alignment.centerRight,
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
            ],
          ),
          size.width > 1046
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SideAppBar(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ButtonColor(false),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
