import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

class CardService extends StatelessWidget {
  String text;
  String number;
  String label;
  bool fixedHeight;

  CardService(this.number, this.text, this.label, this.fixedHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fixedHeight ? 440 : null,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Provider.of<AppColors>(context).backgroundBox4Color,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 55,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Provider.of<AppColors>(context).backgroundBox3Color,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Text(
              number,
              style: GoogleFonts.montserrat(
                color: Provider.of<AppColors>(context).backgroundBox2Color,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: Provider.of<AppColors>(context).backgroundBox2Color,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          fixedHeight
              ? Spacer(
                  flex: 2,
                )
              : SizedBox(
                  height: 40,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.mulish(
                      color: Provider.of<AppColors>(context).text1Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.8,
                      wordSpacing: 1.8),
                  maxLines: 15,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          fixedHeight
              ? Spacer(
                  flex: 3,
                )
              : SizedBox(
                  height: 30,
                ),
        ],
      ),
    );
  }
}
