import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> {
  List<BorderRadius> borderRadius = [
    // BorderRadius.circular(1000),
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
  bool isHover = false;
  int index = 0;
  Timer? _timer;
  Duration duration = const Duration(seconds: 3);

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isHover = !isHover;
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
              'assets/images/portfolio/img5.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
// 'assets/images/portfolio/img5.jpg',
