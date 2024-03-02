import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Image.asset(
              'assets/images/arrowIcon.png',
              width: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.roboto(
                color: Colors.grey.shade700,
                fontSize: 16,
                wordSpacing: 1.8,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
