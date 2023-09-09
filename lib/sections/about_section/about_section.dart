import 'dart:async';
import 'package:flutter/material.dart';
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
      duration: Duration(seconds: 1, milliseconds: 500),
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

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(-0.1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xfff5f5f4),
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: widget.size.width > 1046
                ? Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle('About Me', 'ABOUT', 60),
                        AboutImage(
                          size: widget.size,
                          isBiggerLayout: true,
                        ),
                        Container(
                          height: 1000,
                          color: Colors.red,
                        )
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SectionTitle('About Me', 'ABOUT', 60),
                        AboutImage(
                          size: widget.size,
                          isBiggerLayout: false,
                        ),
                        Container(
                          height: 1000,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
