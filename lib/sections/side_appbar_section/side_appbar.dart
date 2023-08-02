import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/side_appbar_section/component/side_appbar_card.dart';

import '../../models/side_appbar_model.dart';

class SideAppBar extends StatelessWidget {
  const SideAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Color(0xfff8fafc),
      child: Column(
        children: List.generate(
          sideAppBarList.length,
          (index) => SideAppBarCard(index),
        ),
      ),
    );
  }
}
