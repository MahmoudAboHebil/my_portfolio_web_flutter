import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

class YearExp extends StatelessWidget {
  String title;
  String year;
  String mainExp;
  String extraInfo;

  YearExp(this.title, this.year, this.mainExp, this.extraInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                color: Provider.of<AppColors>(context).backgroundBox2Color,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 1,
                      height: 150,
                      color: Provider.of<AppColors>(context).text8Color,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Provider.of<AppColors>(context).text3Color,
                        border: Border.all(
                            color: Provider.of<AppColors>(context).text8Color,
                            width: 1),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Provider.of<AppColors>(context).text7Color,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Text(
                    year,
                    style: GoogleFonts.montserrat(
                      color: Provider.of<AppColors>(context).text6Color,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          mainExp,
                          style: GoogleFonts.montserrat(
                            color: Provider.of<AppColors>(context)
                                .backgroundBox2Color,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          extraInfo,
                          style: GoogleFonts.mulish(
                              color: Provider.of<AppColors>(context).text1Color,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
