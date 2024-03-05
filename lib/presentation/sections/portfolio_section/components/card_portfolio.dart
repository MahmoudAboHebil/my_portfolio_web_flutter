import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

class CardPortfolio extends StatefulWidget {
  final int projectNumber;
  final String? cartImage;
  final Size size;
  final int layout;

  CardPortfolio(this.size, this.layout, this.projectNumber, this.cartImage);

  @override
  State<CardPortfolio> createState() => _CardPortfolioState();
}

class _CardPortfolioState extends State<CardPortfolio> {
  bool isHover = false;
  // double getHight(int layout) {
  //   if (layout == 1) {
  //     return widget.size.height / 3.5;
  //   } else if (layout == 2) {
  //     return 150;
  //   } else {
  //     return widget.size.width / 3;
  //   }
  // }
  //
  // double getWidth(int layout) {
  //   if (layout == 1) {
  //     return widget.size.width / 2;
  //   } else if (layout == 2) {
  //     return widget.size.width / 2;
  //   } else {
  //     return widget.size.width;
  //   }
  // }

  void getPage(int number) {
    Get.rootDelegate.toNamed("/Portfolio/Details_$number");
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cartImage != null) {
      return InkWell(
        onTap: () {
          getPage(widget.projectNumber);
        },
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Provider.of<AppColors>(context).boxBorder2,
            border: Border.all(
                color: Provider.of<AppColors>(context).boxBorder2, width: 9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<AppColors>(context).boxBorder2,
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.cartImage!,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                color: Provider.of<AppColors>(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Flutter',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w500,
                              color: Provider.of<AppColors>(context)
                                  .backgroundBox2Color,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        getPage(widget.projectNumber);
                      },
                      onHover: (value) {
                        setState(() {
                          isHover = value;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: isHover
                            ? EdgeInsets.only(right: 0)
                            : EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Text(
                              'Details',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Provider.of<AppColors>(context)
                                  .backgroundBox2Color,
                              size: 19,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          getPage(widget.projectNumber);
        },
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Provider.of<AppColors>(context).boxBorder2,
            border: Border.all(
                color: Provider.of<AppColors>(context).boxBorder2, width: 9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<AppColors>(context).boxBorder2,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                color: Provider.of<AppColors>(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Flutter',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w500,
                              color: Provider.of<AppColors>(context)
                                  .backgroundBox2Color,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        getPage(widget.projectNumber);
                      },
                      onHover: (value) {
                        setState(() {
                          isHover = value;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: isHover
                            ? EdgeInsets.only(right: 0)
                            : EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Text(
                              'Details',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<AppColors>(context)
                                      .backgroundBox2Color,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Provider.of<AppColors>(context)
                                  .backgroundBox2Color,
                              size: 19,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
