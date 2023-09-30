import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/components/section_title/section_title.dart';
import 'package:portfolio_2/sections/home_section/components/animated_image.dart';
import 'package:portfolio_2/sections/home_section/components/name_and_description.dart';

import 'components/about_image.dart';

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
        margin: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('About Me', 'ABOUT', 60, 28),
            SizedBox(
              height: 20,
            ),
            AboutImage(
              size: widget.size,
              isBiggerLayout: true,
            ),
            SizedBox(
              height: 20,
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
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    } else if (widget.size.width < 1046 && widget.size.width >= 768) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('About Me', 'ABOUT', 60, 24),
            SizedBox(
              height: 20,
            ),
            AboutImage(
              size: widget.size,
              isBiggerLayout: false,
            ),
            SizedBox(
              height: 20,
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
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SectionTitle('About Me', 'ABOUT', 60, 20),
            SizedBox(
              height: 20,
            ),
            AboutImage(
              size: widget.size,
              isBiggerLayout: false,
            ),
            SizedBox(
              height: 20,
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
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),
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
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: aboutContent(),
        ),
      ),
    );
  }
}
