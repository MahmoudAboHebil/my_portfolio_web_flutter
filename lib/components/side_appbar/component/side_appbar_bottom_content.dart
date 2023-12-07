import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideAppBarBottomContent extends StatelessWidget {
  const SideAppBarBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "© 2023",
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Coded by ",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "MahmoudAboHebil",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
