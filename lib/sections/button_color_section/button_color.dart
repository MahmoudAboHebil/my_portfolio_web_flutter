import 'package:flutter/material.dart';

import 'component/dark_icon.dart';

class ButtonColor extends StatefulWidget {
  @override
  State<ButtonColor> createState() => _ButtonColorState();
}

class _ButtonColorState extends State<ButtonColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffD3D3D3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
          ),
          child: DarkIcon(),
        )
      ],
    );
  }
}
