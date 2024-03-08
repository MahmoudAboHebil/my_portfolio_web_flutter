import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';
import '../../../models/side_appbar_model.dart';

// int widget.selectedIndex  = 0;

class SideAppBarCenterContent extends StatefulWidget {
  int selectedIndex;
  int hoverIndex;

  SideAppBarCenterContent(this.selectedIndex, this.hoverIndex, {super.key});

  @override
  State<SideAppBarCenterContent> createState() =>
      _SideAppBarCenterContentState();
}

class _SideAppBarCenterContentState extends State<SideAppBarCenterContent> {
  @override
  void initState() {
    // setState(() {
    //   widget.hoverIndex = widget.selectedIndex;
    //
    // });
    super.initState();
  }

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
        Scaffold.of(context).closeDrawer();
        // locator<NavigationService>().navigatorTo('/${page.label}');
      },
      onHover: (value) {
        setState(() {
          if (value && widget.selectedIndex != index) {
            widget.hoverIndex = index;
          } else {
            widget.hoverIndex = widget.selectedIndex;
          }
        });
      },
      child: AnimatedContainer(
        height: 50,
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.fromLTRB(
            widget.selectedIndex == index || widget.hoverIndex == index
                ? 10
                : 0,
            10,
            0,
            10),
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Icon(
              sideAppBarList[index].icon,
              color: widget.selectedIndex == index
                  ? Provider.of<AppColors>(context).isDarkState
                      ? Color(0xfff8fafc)
                      : Colors.black
                  : Provider.of<AppColors>(context).text10Color,
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
                      ? Provider.of<AppColors>(context).isDarkState
                          ? Color(0xfff8fafc)
                          : Colors.black
                      : Provider.of<AppColors>(context).text10Color,
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
