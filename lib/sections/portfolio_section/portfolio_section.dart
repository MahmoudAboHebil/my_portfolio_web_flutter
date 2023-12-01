import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/section_title/section_title.dart';

class PortfolioSection extends StatefulWidget {
  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    );
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    Timer(
      Duration(milliseconds: 200),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  Widget portfolioContent(Size size) {
    if (size.width >= 1046) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: size.width > 1046 ? 900 : 775,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('Creative Portfolio', 'PORTFOLIO', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardPortfolio(size, true, false),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CardPortfolio(size, true, false),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (size.width < 1046 && size.width >= 650) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 800,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('Creative Portfolio', 'PORTFOLIO', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
                  size.width >= 800
                      ? Row(
                          children: [
                            Expanded(child: CardPortfolio(size, true, true)),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: CardPortfolio(size, true, true)),
                          ],
                        )
                      : Container(
                          width: 600,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CardPortfolio(size, false, false),
                              SizedBox(
                                height: 30,
                              ),
                              CardPortfolio(size, false, false),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SectionTitle('Creative Portfolio', 'PORTFOLIO', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardPortfolio(size, false, false),
                      SizedBox(
                        height: 30,
                      ),
                      CardPortfolio(size, false, false),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      primary: true,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-0.1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: Container(
            color: Color(0xfff5f5f4),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: portfolioContent(size),
          ),
        ),
      ),
    );
  }
}

class CardPortfolio extends StatefulWidget {
  Size size;
  bool isRow;
  bool static;

  CardPortfolio(this.size, this.isRow, this.static);

  @override
  State<CardPortfolio> createState() => _CardPortfolioState();
}

class _CardPortfolioState extends State<CardPortfolio> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return widget.static
        ? Container(
            height: 240,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.grey.shade400, width: 10),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/port.png",
                  fit: BoxFit.cover,
                  height: 170,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Open',
                              style: GoogleFonts.roboto(
                                  color: Colors.black, fontSize: 17),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.open_in_new,
                              color: Colors.black,
                              size: 19,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
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
                  ),
                )
              ],
            ),
          )
        : widget.isRow
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  border: Border.all(color: Colors.grey.shade400, width: 10),
                ),
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: (widget.size.width / 2.6) / 2.4,
                        maxWidth: (widget.size.height / 0.001) / 2.6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/port.png',
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
                                'Open',
                                style: GoogleFonts.roboto(
                                    color: Colors.black, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.open_in_new,
                                color: Colors.black,
                                size: 19,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
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
              )
            : Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  border: Border.all(color: Colors.grey.shade400, width: 10),
                ),
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: widget.size.width / 2.6,
                          maxWidth: widget.size.height / 0.001),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/port.png',
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
                                'Open',
                                style: GoogleFonts.roboto(
                                    color: Colors.black, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.open_in_new,
                                color: Colors.black,
                                size: 19,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
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
              );
  }
}
