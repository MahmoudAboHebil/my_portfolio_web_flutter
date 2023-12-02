import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/components/hover_animation_icon/hover_animation_icon.dart';
import '../../components/section_title/section_title.dart';

class DetailsSection extends StatefulWidget {
  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection>
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

  Widget detailsContent(Size size) {
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
                  SectionTitle('project Informations', 'DETAILS', 60, 30),
                  SizedBox(
                    height: 20,
                  ),
                  ImageDetails(size, 1),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sunnyside Agency Landing',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.mulish(
                        color: Color(0xff4B5563),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'This is a front-end challenge for the \'front end mentor\' website, aimed at creating a page for a small company. The goal is to provide a description of the company and inform users about its activities.'
                            '\n\nIt was a rewarding challenge, and I generated numerous ideas from it. Yes, it was somewhat difficult, especially since I was a novice at that time and it involved JavaScript. However, I conducted extensive research and tackled many of the problems that arose. Eventually, I managed to overcome the challenges and gained a lot of knowledge. I made it user-friendly, adaptable for future development, and responsive.',
                            style: GoogleFonts.mulish(
                                // color: rgba(75,85,99,.8),
                                color: Color.fromRGBO(75, 85, 99, 0.8),
                                height: 1.6,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 1.8),
                            maxLines: 15,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Technology Used',
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ArrowSkill(
                        skill: 'Html,css',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'JavaScript',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'Bootstrap',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'GitHub',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 4.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'May 23 , 2023',
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(75, 85, 99, .9),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More',
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                HoverAnimationIcon(
                                    FontAwesomeIcons.externalLink, 18),
                                SizedBox(
                                  width: 20,
                                ),
                                HoverAnimationIcon(FontAwesomeIcons.github, 22),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
              alignment: Alignment.center,
              width: 650,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('project Informations', 'DETAILS', 60, 28),
                  SizedBox(
                    height: 20,
                  ),
                  ImageDetails(size, 2),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sunnyside Agency Landing',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.mulish(
                        color: Color(0xff4B5563),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'This is a front-end challenge for the \'front end mentor\' website, aimed at creating a page for a small company. The goal is to provide a description of the company and inform users about its activities.'
                          '\n\nIt was a rewarding challenge, and I generated numerous ideas from it. Yes, it was somewhat difficult, especially since I was a novice at that time and it involved JavaScript. However, I conducted extensive research and tackled many of the problems that arose. Eventually, I managed to overcome the challenges and gained a lot of knowledge. I made it user-friendly, adaptable for future development, and responsive.',
                          style: GoogleFonts.mulish(
                              // color: rgba(75,85,99,.8),
                              color: Color.fromRGBO(75, 85, 99, 0.8),
                              height: 1.6,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Technology Used',
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ArrowSkill(
                        skill: 'Html,css',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'JavaScript',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'Bootstrap',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'GitHub',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'May 23 , 2023',
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(75, 85, 99, .9),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More',
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                HoverAnimationIcon(
                                    FontAwesomeIcons.externalLink, 18),
                                SizedBox(
                                  width: 20,
                                ),
                                HoverAnimationIcon(FontAwesomeIcons.github, 22),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
                  SectionTitle('project Informations', 'DETAILS', 60, 20),
                  SizedBox(
                    height: 20,
                  ),
                  ImageDetails(size, 3),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sunnyside Agency Landing',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.mulish(
                        color: Color(0xff4B5563),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'This is a front-end challenge for the \'front end mentor\' website, aimed at creating a page for a small company. The goal is to provide a description of the company and inform users about its activities.'
                          '\n\nIt was a rewarding challenge, and I generated numerous ideas from it. Yes, it was somewhat difficult, especially since I was a novice at that time and it involved JavaScript. However, I conducted extensive research and tackled many of the problems that arose. Eventually, I managed to overcome the challenges and gained a lot of knowledge. I made it user-friendly, adaptable for future development, and responsive.',
                          style: GoogleFonts.mulish(
                              // color: rgba(75,85,99,.8),
                              color: Color.fromRGBO(75, 85, 99, 0.8),
                              height: 1.6,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Technology Used',
                    style: GoogleFonts.mulish(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ArrowSkill(
                        skill: 'Html,css',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'JavaScript',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'Bootstrap',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ArrowSkill(
                        skill: 'GitHub',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width / 1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Data',
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'May 23 , 2023',
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(75, 85, 99, .9),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More',
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                HoverAnimationIcon(
                                    FontAwesomeIcons.externalLink, 18),
                                SizedBox(
                                  width: 20,
                                ),
                                HoverAnimationIcon(FontAwesomeIcons.github, 22),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
            child: detailsContent(size),
          ),
        ),
      ),
    );
  }
}

class ArrowSkill extends StatelessWidget {
  String skill;
  ArrowSkill({
    required this.skill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_right,
          size: 24,
        ),
        SizedBox(
          width: 1,
        ),
        Text(
          skill,
          style: GoogleFonts.montserrat(
            color: Color.fromRGBO(75, 85, 99, .9),
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class ImageDetails extends StatefulWidget {
  Size size;
  int layout;

  ImageDetails(this.size, this.layout);

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  bool isHover = false;
  double getHight(int layout) {
    if (layout == 1) {
      return widget.size.width / 3.3;
    } else if (layout == 2) {
      return 280;
    } else {
      return widget.size.width / 2.5;
    }
  }

  double getWidth(int layout) {
    if (layout == 1) {
      return widget.size.width / 1.5;
    } else if (layout == 2) {
      return 650;
    } else {
      return widget.size.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
