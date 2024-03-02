import 'package:flutter/material.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({
    super.key,
    required this.size,
    required this.isBiggerLayout,
  });

  final Size size;
  final bool isBiggerLayout;

  @override
  Widget build(BuildContext context) {
    return isBiggerLayout
        ? Container(
            constraints: BoxConstraints(
                maxHeight: size.width / 2.6, maxWidth: size.height / 0.001),
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/portfolio/img2.jpg',
                ),
              ),
            ),
          )
        : Container(
            constraints: BoxConstraints(
                maxHeight: size.width / 2.2, maxWidth: size.height / 0.5),
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  'assets/images/portfolio/img2.jpg',
                ),
              ),
            ),
          );
  }
}
//  'assets/images/portfolio/img1.jpg',
