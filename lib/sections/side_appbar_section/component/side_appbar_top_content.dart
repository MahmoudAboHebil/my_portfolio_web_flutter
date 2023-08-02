import 'package:flutter/material.dart';

class SideAppBarTopContent extends StatelessWidget {
  const SideAppBarTopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'MAHMOUD',
          style: TextStyle(
            letterSpacing: 1.5,
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
