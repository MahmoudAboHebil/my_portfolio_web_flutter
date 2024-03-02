import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

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
            color: Colors.grey.shade400,
            border: Border.all(color: Colors.grey.shade400, width: 10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
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
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Flutter',
                          style: GoogleFonts.roboto(
                              color: Colors.black, fontSize: 17),
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
                              style: GoogleFonts.roboto(
                                  color: Colors.black, fontSize: 17),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.black,
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
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            border: Border.all(color: Colors.grey.shade400, width: 10),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Flutter',
                          style: GoogleFonts.roboto(
                              color: Colors.black, fontSize: 17),
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
                              style: GoogleFonts.roboto(
                                  color: Colors.black, fontSize: 17),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.black,
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
