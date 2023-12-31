import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardService extends StatelessWidget {
  String text;
  String number;
  String label;

  CardService(this.number, this.text, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 0.3,
          spreadRadius: 0.5,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xffdadde2),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Text(
              number,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            label,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade700,
                      height: 1.8,
                      fontSize: 16,
                      wordSpacing: 1.8),
                  maxLines: 15,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
