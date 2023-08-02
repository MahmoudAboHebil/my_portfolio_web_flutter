import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/side_appbar_section/component/side_appbar_center_content.dart';
import 'package:portfolio_2/sections/side_appbar_section/component/side_appbar_top_content.dart';
import 'component/side_appbar_bottom_content.dart';

class SideAppBar extends StatelessWidget {
  const SideAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(10),
      color: Color(0xfff8fafc),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SideAppBarTopContent(),
            SizedBox(
              height: 40,
            ),
            SideAppBarCenterContent(),
            SizedBox(
              height: 150,
            ),
            SideAppBarBottomContent(),
          ],
        ),
      ),
    );
  }
}
