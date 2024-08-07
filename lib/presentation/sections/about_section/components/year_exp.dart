import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/models/eduAndExp_model/eduAndExp_model.dart';
import '../../../app_colors/app_colors.dart';

class YearExp extends StatelessWidget {
  List<EduAndExpModel> list;
  String type;

  YearExp(this.list, this.type);
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            type,
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
        Column(
          children: List.generate(
            list.length,
            (index) {
              return Row(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: Provider.of<AppColors>(context).text3Color,
                              border: Border.all(
                                  color: Provider.of<AppColors>(context)
                                      .text8Color,
                                  width: 1),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Provider.of<AppColors>(context).text7Color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Text(
                          '${list[index].startDate} - ${list[index].endDate}',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    list[index].title,
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
                            Row(
                              children: [
                                list[index].certifUrl != null
                                    ? Padding(
                                        padding:
                                            EdgeInsets.only(right: 8, top: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            _launchUrl(list[index].certifUrl!);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.certificate,
                                            size: 16,
                                            color: Color(0xffFFD700),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                list[index].linkedUrl != null
                                    ? Padding(
                                        padding:
                                            EdgeInsets.only(right: 8, top: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            _launchUrl(list[index].linkedUrl!);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.linkedin,
                                            size: 16,
                                            color:
                                                Provider.of<AppColors>(context)
                                                    .iconColor,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                list[index].url != null
                                    ? Padding(
                                        padding:
                                            EdgeInsets.only(right: 8, top: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            _launchUrl(list[index].url!);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons
                                                .arrowUpRightFromSquare,
                                            size: 14,
                                            color:
                                                Provider.of<AppColors>(context)
                                                    .iconColor,
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
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
                                list[index].description.toString(),
                                style: GoogleFonts.mulish(
                                    color: Provider.of<AppColors>(context)
                                        .text1Color,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
