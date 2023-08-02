import 'package:flutter/material.dart';
import 'package:portfolio_2/models/side_appbar_model.dart';

class SideAppBarCard extends StatelessWidget {
  final int index;

  SideAppBarCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(sideAppBarList[index].icon),
        Text(sideAppBarList[index].label)
      ],
    );
  }
}
