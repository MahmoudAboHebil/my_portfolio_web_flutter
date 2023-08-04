import 'package:flutter/material.dart';
import 'package:portfolio_2/sections/side_appbar_section/component/menu.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Menu(),
      ],
    );
  }
}
