import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                // constraints: BoxConstraints(maxHeight: size.height, minHeight: 700),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/person.png',
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'MAHMOUD ABO HEBIL',
                  style: GoogleFonts.roboto(
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mobile Application Developer',
                  style: GoogleFonts.roboto(
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Programmer based in Alexandria Love Build Applications and \n developing them with Flutter And Java & Kotlin',
                  style: GoogleFonts.roboto(
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
