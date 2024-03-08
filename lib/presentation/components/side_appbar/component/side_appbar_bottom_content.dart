import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

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
              color: Provider.of<AppColors>(context).largeTextColor,
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
                    color: Provider.of<AppColors>(context).largeTextColor,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "MahmoudAboHebil",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Provider.of<AppColors>(context).largeTextColor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "Flutter framework",
                  style: GoogleFonts.montserrat(
                      color: Provider.of<AppColors>(context).largeTextColor,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ],
    );
  }
}
