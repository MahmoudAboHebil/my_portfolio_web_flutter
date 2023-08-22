import 'package:flutter/material.dart';

import 'component/dark_icon.dart';

class ButtonColor extends StatefulWidget {
  bool isFullyCircule;
  ButtonColor(this.isFullyCircule);
  @override
  State<ButtonColor> createState() => _ButtonColorState();
}

class _ButtonColorState extends State<ButtonColor> {
  final kDefaultShadow = BoxShadow(
    blurRadius: 1,
    color: Colors.grey,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: widget.isFullyCircule ? 38 : 50,
          height: widget.isFullyCircule ? 38 : 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [kDefaultShadow],
            color: Colors.grey.shade300,
            borderRadius: widget.isFullyCircule
                ? BorderRadius.all(Radius.circular(1000))
                : BorderRadius.only(
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
