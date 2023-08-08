import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  Duration duration = const Duration(seconds: 2, milliseconds: 500);
  Timer? _timer;
  List<BorderRadius> borderRadius = [
    BorderRadius.only(
      topLeft: Radius.circular(50 * 3),
      topRight: Radius.circular(70 * 3),
      bottomRight: Radius.circular(50 * 3),
      bottomLeft: Radius.circular(70 * 3),
    ),
    BorderRadius.only(
      topLeft: Radius.circular(70 * 3),
      topRight: Radius.circular(50 * 3),
      bottomRight: Radius.circular(70 * 3),
      bottomLeft: Radius.circular(50 * 3),
    ),
  ];
  int index = 0;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          index = (index + 1) % borderRadius.length;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xfff5f5f4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isHover = !isHover;
                  print(isHover);
                });
              },
              child: AnimatedContainer(
                duration: duration,
                curve: Curves.linear,
                height: 300,
                width: 300,
                // constraints: BoxConstraints(maxHeight: size.height, minHeight: 700),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 10),
                  borderRadius: borderRadius[index],
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/person.png',
                    ),
                  ),
                ),
              ),
            ),
            // AnimatedBorderComponent(),
            SizedBox(
              width: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MAHMOUD ABO HEBIL',
                  style: GoogleFonts.berkshireSwash(
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Mobile Application Developer',
                      textStyle: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: Duration(milliseconds: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Programmer based in Alexandria Love Build Applications and\ndeveloping them with Flutter And Java & Kotlin',
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    HoverAnimationIcon(Icons.facebook_outlined, 28),
                    SizedBox(
                      width: 20,
                    ),
                    HoverAnimationIcon(FontAwesomeIcons.github, 26),
                    SizedBox(
                      width: 20,
                    ),
                    HoverAnimationIcon(FontAwesomeIcons.linkedin, 24),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HoverAnimationIcon extends StatefulWidget {
  IconData icon;
  double size;
  HoverAnimationIcon(this.icon, this.size);
  @override
  State<HoverAnimationIcon> createState() => _HoverAnimationIconState();
}

class _HoverAnimationIconState extends State<HoverAnimationIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (v) {
        setState(() {
          isHover = v;
        });
      },
      onTap: () {
        setState(() {
          isHover = !isHover;
        });
      },
      child: AbsorbPointer(
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 25,
                width: 25,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                top: isHover ? -7 : 0,
                bottom: !isHover ? 0 : null,
                child: Icon(
                  widget.icon,
                  size: widget.size,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
