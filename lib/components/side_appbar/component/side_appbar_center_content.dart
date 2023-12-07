import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/locator.dart';
import 'package:portfolio_2/routing/route_names.dart';
import 'package:portfolio_2/services/navigtion_service.dart';

import '../../../models/side_appbar_model.dart';

// int selectedIndex  = 0;

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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        sideAppBarList.length,
        (index) => buildMenuItem(index, sideAppBarList[index]),
      ),
    );
  }

  // String getRouteName(String label){
  //   String pageRoute;
  //   switch (label){
  //     case 'Home':
  //       pageRoute="HomeRoute";
  //       break;
  //     case 'About':
  //       pageRoute="AboutRoute";
  //       break;
  //     case 'Service':
  //       pageRoute="ServiceRoute";
  //       break;
  //     case 'Portfolio':
  //       pageRoute="PortfolioRoute";
  //       break;
  //
  //   }
  //
  // }

  Widget buildMenuItem(int index, SideAppBarModel page) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        locator<NavigationService>().navigatorTo('/${page.label}');
        widget.callBackSelectedIndex(index);
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
              color: selectedIndex == index
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
                  letterSpacing: selectedIndex == index ? 1.5 : 1,
                  fontWeight: FontWeight.w500,
                  color: selectedIndex == index
                      ? Colors.black
                      : Color.fromRGBO(63, 63, 70, .8),
                  fontSize: selectedIndex == index ? 18 : 16),

              // TextStyle(
              //   letterSpacing: selectedIndex  == index ? 1.5 : 1,
              //   color: selectedIndex  == index
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
