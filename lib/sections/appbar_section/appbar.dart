import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final double height;

  MyAppBar({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
