import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../app_colors/app_colors.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle(this.title, this.boxTitle, this.widthOfBox, this.fontSize);
  double widthOfBox;
  double fontSize;
  String boxTitle;

  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Provider.of<AppColors>(context).backgroundBoxColor,
              height: 30,
              // width: boxTitle == 'PORTFOLIO' || boxTitle == 'CONTACT' ? 80 : 60,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              child: Text(
                boxTitle,
                style: GoogleFonts.montserrat(
                  color: Provider.of<AppColors>(context).text2Color,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: Provider.of<AppColors>(context).textTitleColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
