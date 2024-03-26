import 'package:flutter/material.dart';
import 'package:abohebil_portfolio/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

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
            color: Provider.of<AppColors>(context).buttonColor,
            borderRadius: widget.isFullyCircule
                ? BorderRadius.all(Radius.circular(1000))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
          ),
          child:
              DarkIcon(isDarkInit: Provider.of<AppColors>(context).isDarkState),
        )
      ],
    );
  }
}
