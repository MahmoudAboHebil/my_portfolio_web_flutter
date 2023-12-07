import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTitle extends StatelessWidget {
  InfoTitle({
    required this.title,
    required this.text,
    super.key,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.roboto(
                  color: Colors.grey.shade800,
                  fontSize: 16,
                  wordSpacing: 1.8,
                  fontWeight: FontWeight.w400),
              maxLines: 10,
            ),
          )
        ],
      ),
    );
  }
}
