import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:abohebil_portfolio/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

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
                style: GoogleFonts.mulish(
                  fontStyle: FontStyle.italic,
                  color: Provider.of<AppColors>(context).text4Color,
                  fontSize: 16,
                ),
              ),
              Text(
                '$percent%',
                style: GoogleFonts.mulish(
                  fontStyle: FontStyle.italic,
                  color: Provider.of<AppColors>(context).text4Color,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        LinearPercentIndicator(
          lineHeight: 4,
          percent: percent / 100.0,
          backgroundColor: Provider.of<AppColors>(context).backgroundIndColor,
          progressColor: Provider.of<AppColors>(context).indColor,
        ),
      ],
    );
  }
}
