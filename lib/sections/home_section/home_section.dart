import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xfff5f5f4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              // constraints: BoxConstraints(maxHeight: size.height, minHeight: 700),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 10),
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(60 * 3),
                  // topRight: Radius.circular(70 * 2),
                  // bottomRight: Radius.circular(60 * 3),
                  // bottomLeft: Radius.circular(70 * 2),

                  topLeft: Radius.circular(70 * 3),
                  topRight: Radius.circular(80 * 2),
                  bottomRight: Radius.circular(70 * 3),
                  bottomLeft: Radius.circular(70 * 2),
                ),
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/person.png',
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
                Text(
                  'Mobile Application Developer',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
                  children: [
                    Container(
                      child: Icon(
                        Icons.facebook_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Icon(
                        FontAwesomeIcons.github,
                        size: 23,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Icon(
                        FontAwesomeIcons.linkedin,
                        size: 23,
                        color: Colors.black,
                      ),
                    )
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

class AnimatedBorderComponent extends StatefulWidget {
  const AnimatedBorderComponent({super.key});

  @override
  State<AnimatedBorderComponent> createState() {
    return _AnimatedBorderComponentState();
  }
}

class _AnimatedBorderComponentState extends State<AnimatedBorderComponent> {
  int index = 0;
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];
  Duration duration = const Duration(milliseconds: 250);
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // set up a timer, make state changes, and redraw.
    _timer = Timer.periodic(duration, (timer) {
      index = (index + 1) % colors.length;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    // make sure to dispose of the timer when you're done.
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeInOut,
      width: 100,
      height: 100,

      // change whatever properties you want, and the
      // AnimatedContainer takes care of the heavy lifting.
      decoration: BoxDecoration(
        color: Colors.redAccent,
        border: Border.all(
            color: colors[index], style: BorderStyle.solid, width: 4),
      ),
    );
  }
}
