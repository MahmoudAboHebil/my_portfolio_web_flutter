import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

class DarkIcon extends StatefulWidget {
  final bool isDarkInit;
  const DarkIcon({super.key, required this.isDarkInit});

  @override
  State<DarkIcon> createState() => _DarkIconState();
}

class _DarkIconState extends State<DarkIcon> {
  @override
  void initState() {
    isDark = widget.isDarkInit;
    super.initState();
  }

  late bool isDark;
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
          onPressed: () {
            setState(() {
              isDark = !isDark;
              Provider.of<AppColors>(context, listen: false)
                  .setColorMode(isDark);
            });
          },
          color: Colors.black,
          icon: isDark
              ? Icon(
                  Icons.wb_sunny_sharp,
                  size: 21,
                  color: Color(0xfff8fafc),
                )
              : Icon(
                  Icons.brightness_2,
                  size: 21,
                  color: Colors.black,
                ),
        ),
      ),
    );
  }
}
