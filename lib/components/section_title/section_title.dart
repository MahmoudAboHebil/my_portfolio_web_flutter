import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Container(
          color: Color(0xffd8dbe0),
          height: 30,
          width: boxTitle == 'PORTFOLIO' || boxTitle == 'CONTACT' ? 80 : 60,
          alignment: Alignment.center,
          padding: EdgeInsets.all(0),
          child: Text(
            boxTitle,
            style: GoogleFonts.montserrat(
              color: Color(0xff1f2937),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
