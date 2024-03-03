import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

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
      decoration: BoxDecoration(
          color: Provider.of<AppColors>(context).backgroundColor,
          border: Border.all(
              color: Provider.of<AppColors>(context).boxBorder, width: 1),
          boxShadow: [
            BoxShadow(
                color: Provider.of<AppColors>(context).shadowColor,
                blurRadius: 4,
                spreadRadius: 0.5,
                offset: Offset(1, 3))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            leading,
            style: GoogleFonts.montserrat(
              color: Provider.of<AppColors>(context).backgroundBox2Color,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: GoogleFonts.mulish(
                color: Provider.of<AppColors>(context).text1Color,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.8,
                wordSpacing: 1.8),
          )
        ],
      ),
    );
  }
}
