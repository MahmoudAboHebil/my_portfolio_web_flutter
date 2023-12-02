import 'package:flutter/material.dart';
import 'package:portfolio_2/components/side_appbar/component/side_appbar_center_content.dart';
import 'package:portfolio_2/models/side_appbar_model.dart';
import 'package:portfolio_2/sections/about_section/about_section.dart';
import 'package:portfolio_2/sections/home_section/home_section.dart';
import 'package:portfolio_2/sections/portfolio_section/portfolio_section.dart';
import 'package:portfolio_2/sections/service_section/service_section.dart';

import '../components/button_color/button_color.dart';
import '../components/custom_appbar/custom_appbar.dart';
import '../components/side_appbar/side_appbar.dart';
import '../locator.dart';
import '../routing/route_names.dart';
import '../routing/router.dart';
import '../services/navigtion_service.dart';

class DesktopLayout extends StatefulWidget {
  ScrollController _controller;
  Widget child;
  DesktopLayout(this._controller, this.child);
  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  ScrollController yourScrollController = ScrollController();
  int selectedIndex = 3;
  callBackSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Widget getPage(Size size, int index) {
  //   String pageName = sideAppBarList[index].label;
  //   if (pageName == 'Home') {
  //     return HomeSection(size);
  //   } else if (pageName == 'About') {
  //     return AboutSection(size);
  //   } else if (pageName == 'Service') {
  //     return ServiceSection(size);
  //   } else if (pageName == 'Portfolio') {
  //     return PortfolioSection(size);
  //   } else {
  //     return HomeSection(size);
  //   }
  // }

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
          Container(
            alignment:
                size.width > 1046 ? Alignment.center : Alignment.centerRight,
            child: Column(
              children: [
                !(size.width > 1046) ? CustomAppBar() : SizedBox(),
                Expanded(
                  child: AnimatedContainer(
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
                    child: widget.child,
                  ),
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
