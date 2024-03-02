import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearExp extends StatelessWidget {
  String title;
  String year;
  String mainExp;
  String extraInfo;

  YearExp(this.title, this.year, this.mainExp, this.extraInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.4,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Row(
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 2,
                      height: 150,
                      color: Color(0xffdee3e9),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffdee3e9), width: 1),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xffeaecef),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Text(
                    year,
                    style: GoogleFonts.roboto(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                        wordSpacing: 1.8,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          mainExp,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                              wordSpacing: 1.6),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          extraInfo,
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade800,
                              fontSize: 14,
                              wordSpacing: 1.8,
                              fontWeight: FontWeight.w400),
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
