import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardFunFact extends StatelessWidget {
  String leading;
  String title;

  CardFunFact(this.leading, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(color: Color(0xfff5f5f4), boxShadow: [
        BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            spreadRadius: 1.0,
            offset: Offset(0, 1.5))
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            leading,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
                color: Colors.grey.shade600,
                height: 1.8,
                fontSize: 16,
                wordSpacing: 1.8,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
