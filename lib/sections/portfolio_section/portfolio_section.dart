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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        child: CardPortfolio(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CardPortfolio(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('Creative Portfolio', 'PORTFOLIO', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
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

    return SlideTransition(
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
    );
  }
}

class CardPortfolio extends StatefulWidget {
  @override
  State<CardPortfolio> createState() => _CardPortfolioState();
}

class _CardPortfolioState extends State<CardPortfolio> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        border: Border.all(color: Colors.grey.shade400, width: 10),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/port.png",
            fit: BoxFit.cover,
            height: 200,
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
    );
  }
}
