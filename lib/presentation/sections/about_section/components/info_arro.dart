import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abohebil_portfolio/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

class InfoArro extends StatelessWidget {
  final String text;

  InfoArro(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Transform.rotate(
            angle: 180 * pi / 180,
            child: !Provider.of<AppColors>(context).isDarkState
                ? Image.asset(
                    'assets/images/arrowIcon.png',
                    width: 20,
                  )
                : Image.asset(
                    'assets/images/arrowIconD1.png',
                    width: 20,
                  ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.mulish(
                color: Provider.of<AppColors>(context).text1Color,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
