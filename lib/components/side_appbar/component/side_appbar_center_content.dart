import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/side_appbar_model.dart';

// int widget.selectedIndex  = 0;

class SideAppBarCenterContent extends StatefulWidget {
  int selectedIndex;
  Function callBackSelectedIndex;

  SideAppBarCenterContent(this.selectedIndex, this.callBackSelectedIndex);

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
        (index) => buildMenuItem(index),
      ),
    );
  }

  Widget buildMenuItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selectedIndex = index;
        });
        widget.callBackSelectedIndex(index);
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
                  : Colors.grey.shade700,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Text(sideAppBarList[index].label,
                style: GoogleFonts.quicksand(
                  letterSpacing: widget.selectedIndex == index ? 1.5 : 1,
                  fontSize: 18,
                  fontWeight: widget.selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                )

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
