import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/components/section_title/section_title.dart';
import 'package:portfolio_2/sections/home_section/components/animated_image.dart';
import 'package:portfolio_2/sections/home_section/components/name_and_description.dart';

import 'components/about_image.dart';

///todo: fix the padding or margin around wight box
class AboutSection extends StatefulWidget {
  Size size;
  AboutSection(this.size);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    Timer(
      Duration(milliseconds: 300),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  Widget aboutContent() {
    if (widget.size.width >= 1046) {
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
                  SizedBox(
                    height: 30,
                  ),
                  SectionTitle('About Me', 'ABOUT', 60, 30),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: widget.size,
                    isBiggerLayout: true,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Mahmoud Abo Hebill',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Hi, my name is Mahmoud AboHebil, and I\'ve been getting to know programming, website development, construction, and React.js.I\'ve spent most of my time learning and building websites in my specialties building up state-of-the-art Web sites through React.js.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              height: 1.8,
                              fontSize: 16,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 160,
                    color: Colors.black,
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      );
    } else if (widget.size.width < 1046 && widget.size.width >= 650) {
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
                  SectionTitle('About Me', 'ABOUT', 60, 28),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: widget.size,
                    isBiggerLayout: false,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Mahmoud Abo Hebill',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Hi, my name is Mahmoud AboHebil, and I\'ve been getting to know programming, website development, construction, and React.js.I\'ve spent most of my time learning and building websites in my specialties building up state-of-the-art Web sites through React.js.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              height: 1.8,
                              fontSize: 16,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 160,
                    color: Colors.black,
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.white,
            )
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
                  SectionTitle('About Me', 'ABOUT', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: widget.size,
                    isBiggerLayout: false,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Mahmoud Abo Hebill',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Hi, my name is Mahmoud AboHebil, and I\'ve been getting to know programming, website development, construction, and React.js.I\'ve spent most of my time learning and building websites in my specialties building up state-of-the-art Web sites through React.js.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              height: 1.8,
                              fontSize: 16,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 160,
                    color: Colors.black,
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: aboutContent(),
        ),
      ),
    );
  }
}
