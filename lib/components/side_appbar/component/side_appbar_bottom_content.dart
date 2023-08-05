import 'package:flutter/material.dart';

class SideAppBarBottomContent extends StatelessWidget {
  const SideAppBarBottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "© 2023",
          style: TextStyle(
              color: Colors.grey.shade700, fontStyle: FontStyle.italic),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Coded by ",
                style: TextStyle(
                    color: Colors.grey.shade700, fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: "MahmoudAboHebil",
                style:
                    TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
