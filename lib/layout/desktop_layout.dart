import 'package:flutter/material.dart';

import '../components/button_color/button_color.dart';
import '../components/custom_appbar/custom_appbar.dart';
import '../components/side_appbar/side_appbar.dart';
import '../locator.dart';
import '../routing/route_names.dart';
import '../services/navigtion_service.dart';
import 'package:path/path.dart';

class DesktopLayout extends StatefulWidget {
  ScrollController _controller;
  Widget child;
  DesktopLayout(this._controller, this.child);
  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  ScrollController yourScrollController = ScrollController();
  int selectedIndex = 0;

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
                    SideAppBar(0),
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
