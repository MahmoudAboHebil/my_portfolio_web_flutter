import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/hover_animation_icon/hover_animation_icon.dart';

class NameAndDescription extends StatelessWidget {
  bool isBiggerLayout;

  NameAndDescription(this.isBiggerLayout);

  @override
  Widget build(BuildContext context) {
    return isBiggerLayout
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'MAHMOUD ABO HEBIL',
                      style: GoogleFonts.berkshireSwash(
                        letterSpacing: 1.5,
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText('Mobile Application Developer',
                      textStyle: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: Duration(milliseconds: 25),
                      textAlign: TextAlign.start),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Programmer based in Alexandria Love Build Applications and developing them with Flutter And Java & Kotlin.',
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HoverAnimationIcon(Icons.facebook_outlined, 28,
                      'https://www.facebook.com/mahmoud.lored.1'),
                  SizedBox(
                    width: 20,
                  ),
                  HoverAnimationIcon(FontAwesomeIcons.github, 26,
                      'https://github.com/MahmoudAboHebil'),
                  SizedBox(
                    width: 20,
                  ),
                  HoverAnimationIcon(FontAwesomeIcons.linkedin, 24,
                      'https://www.linkedin.com/in/mahmoud-abo-hebil-03bbb9231/'),
                ],
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'MAHMOUD ABO HEBIL',
                        style: GoogleFonts.berkshireSwash(
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 65,
                alignment: Alignment.center,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Mobile Application Developer',
                        textStyle: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: Duration(milliseconds: 25),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // width: 450,
                constraints: BoxConstraints(maxWidth: 450),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Programmer based in Alexandria Love Build Applications and developing them with Flutter And Java & Kotlin.',
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HoverAnimationIcon(Icons.facebook_outlined, 28,
                      'https://www.facebook.com/mahmoud.lored.1'),
                  SizedBox(
                    width: 20,
                  ),
                  HoverAnimationIcon(FontAwesomeIcons.github, 26,
                      'https://github.com/MahmoudAboHebil'),
                  SizedBox(
                    width: 20,
                  ),
                  HoverAnimationIcon(FontAwesomeIcons.linkedin, 24,
                      'https://www.linkedin.com/in/mahmoud-abo-hebil-03bbb9231/'),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          );
  }
}
