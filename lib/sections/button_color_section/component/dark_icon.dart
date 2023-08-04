import 'package:flutter/material.dart';
import 'dart:math' as math;

class DarkIcon extends StatelessWidget {
  const DarkIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        // borderRadius: BorderRadius.circular(50),
      ),
      child: Transform.rotate(
        angle: 180 * math.pi / 230,
        child: IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: Icon(
            Icons.brightness_2,
            size: 25,
          ),
        ),
      ),
    );
  }
}
