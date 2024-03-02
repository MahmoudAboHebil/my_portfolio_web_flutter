import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExpPercent extends StatelessWidget {
  String title;
  int percent;

  ExpPercent(this.title, this.percent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
              ),
              Text(
                '$percent%',
                style: GoogleFonts.roboto(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        LinearPercentIndicator(
          lineHeight: 4,
          percent: percent / 100.0,
          backgroundColor: Colors.grey,
          progressColor: Colors.black,
        ),
      ],
    );
  }
}
