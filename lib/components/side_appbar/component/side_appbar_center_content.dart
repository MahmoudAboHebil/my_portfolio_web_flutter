import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/locator.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/services/navigtion_service.dart';

import '../../../models/side_appbar_model.dart';

// int widget.selectedIndex  = 0;

class SideAppBarCenterContent extends StatefulWidget {
  int selectedIndex;

  SideAppBarCenterContent(this.selectedIndex);

  @override
  State<SideAppBarCenterContent> createState() =>
      _SideAppBarCenterContentState();
}

class _SideAppBarCenterContentState extends State<SideAppBarCenterContent> {
  int hoverIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        sideAppBarList.length,
        (index) => buildMenuItem(index, sideAppBarList[index]),
      ),
    );
  }

  Widget buildMenuItem(int index, SideAppBarModel page) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selectedIndex = index;
        });
        Get.rootDelegate.toNamed('/${page.label}');
        // locator<NavigationService>().navigatorTo('/${page.label}');
      },
      onHover: (value) {
        setState(() {
          if (value && widget.selectedIndex != index) {
            hoverIndex = index;
          } else {
            hoverIndex = widget.selectedIndex;
          }
        });
      },
      child: AnimatedContainer(
        height: 50,
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.fromLTRB(
            widget.selectedIndex == index || hoverIndex == index ? 10 : 0,
            10,
            0,
            10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Icon(
              sideAppBarList[index].icon,
              color: widget.selectedIndex == index
                  ? Colors.black
                  : Color.fromRGBO(63, 63, 70, .8),
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              sideAppBarList[index].label,
              style: GoogleFonts.montserrat(
                  letterSpacing: widget.selectedIndex == index ? 1.5 : 1,
                  fontWeight: FontWeight.w500,
                  color: widget.selectedIndex == index
                      ? Colors.black
                      : Color.fromRGBO(63, 63, 70, .8),
                  fontSize: widget.selectedIndex == index ? 18 : 16),

              // TextStyle(
              //   letterSpacing: widget.selectedIndex  == index ? 1.5 : 1,
              //   color: widget.selectedIndex  == index
              //       ? Colors.black
              //       : Colors.grey.shade700,
              //   fontSize: 18,
              // ),
            )
          ],
        ),
      ),
    );
  }
}
