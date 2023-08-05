import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/side_appbar_model.dart';

class SideAppBarCenterContent extends StatefulWidget {
  const SideAppBarCenterContent({super.key});

  @override
  State<SideAppBarCenterContent> createState() =>
      _SideAppBarCenterContentState();
}

class _SideAppBarCenterContentState extends State<SideAppBarCenterContent> {
  int selectedIndex = 0;
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
          selectedIndex = index;
        });
      },
      onHover: (value) {
        setState(() {
          if (value && selectedIndex != index) {
            hoverIndex = index;
          } else {
            hoverIndex = selectedIndex;
          }
        });
      },
      child: AnimatedContainer(
        height: 50,
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.fromLTRB(
            selectedIndex == index || hoverIndex == index ? 10 : 0, 10, 0, 10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Icon(
              sideAppBarList[index].icon,
              color:
                  selectedIndex == index ? Colors.black : Colors.grey.shade700,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Text(sideAppBarList[index].label,
                style: GoogleFonts.quicksand(
                  letterSpacing: selectedIndex == index ? 1.5 : 1,
                  fontSize: 18,
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                )

                // TextStyle(
                //   letterSpacing: selectedIndex == index ? 1.5 : 1,
                //   color: selectedIndex == index
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
