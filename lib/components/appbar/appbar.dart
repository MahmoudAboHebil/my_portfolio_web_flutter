import 'package:flutter/material.dart';

import '../side_appbar/component/menu.dart';

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
