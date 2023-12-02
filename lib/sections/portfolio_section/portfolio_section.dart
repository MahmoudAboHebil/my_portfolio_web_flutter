import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/routing/route_names.dart';
import '../../components/section_title/section_title.dart';
import '../../locator.dart';
import '../../services/navigtion_service.dart';

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
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CardPortfolio(size, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CardPortfolio(size, 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CardPortfolio(size, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CardPortfolio(size, 1),
                          ),
                        ],
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
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: CardPortfolio(size, 2)),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(child: CardPortfolio(size, 2)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(child: CardPortfolio(size, 2)),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(child: CardPortfolio(size, 2)),
                              ],
                            ),
                          ],
                        )
                      : Container(
                          width: 600,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CardPortfolio(size, 3),
                              SizedBox(
                                height: 30,
                              ),
                              CardPortfolio(size, 3),
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
                      CardPortfolio(size, 3),
                      SizedBox(
                        height: 30,
                      ),
                      CardPortfolio(size, 3),
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
  int layout;

  CardPortfolio(this.size, this.layout);

  @override
  State<CardPortfolio> createState() => _CardPortfolioState();
}

class _CardPortfolioState extends State<CardPortfolio> {
  bool isHover = false;
  double getHight(int layout) {
    if (layout == 1) {
      return widget.size.width / 7;
    } else if (layout == 2) {
      return 150;
    } else {
      return widget.size.width / 3;
    }
  }

  double getWidth(int layout) {
    if (layout == 1) {
      return widget.size.width / 2;
    } else if (layout == 2) {
      return widget.size.width / 2;
    } else {
      return widget.size.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        border: Border.all(color: Colors.grey.shade400, width: 10),
      ),
      child: Column(
        children: [
          Container(
            width: getWidth(widget.layout),
            height: getHight(widget.layout),
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
                      style:
                          GoogleFonts.roboto(color: Colors.black, fontSize: 17),
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
                  onTap: () {
                    locator<NavigationService>().navigatorTo(DetailsRoute);
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
    );
  }
}
