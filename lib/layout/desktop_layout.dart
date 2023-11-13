import 'package:flutter/material.dart';
import 'package:portfolio_2/components/side_appbar/component/side_appbar_center_content.dart';
import 'package:portfolio_2/models/side_appbar_model.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';
import 'package:portfolio_2/sections/home_section/home_section.dart';

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
  int selectedIndex = 0;
  callBackSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getPage(Size size, int index) {
    String pageName = sideAppBarList[index].label;
    if (pageName == 'Home') {
      return HomeSection(size);
    } else if (pageName == 'About') {
      return AboutSection(size);
    } else {
      return HomeSection(size);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      child: getPage(size, selectedIndex),
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
                    SideAppBar(selectedIndex, callBackSelectedIndex),
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
