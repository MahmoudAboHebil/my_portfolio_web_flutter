import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

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
            width: 100,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: GoogleFonts.mulish(
                  color: Provider.of<AppColors>(context).textTitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.mulish(
                color: Provider.of<AppColors>(context).text1Color,
                fontSize: 16,
                wordSpacing: 1.8,
              ),
              maxLines: 10,
            ),
          )
          // rgba(75,85,99,.9)
        ],
      ),
    );
  }
}
