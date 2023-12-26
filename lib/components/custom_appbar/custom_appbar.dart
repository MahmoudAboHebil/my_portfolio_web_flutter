import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../button_color/button_color.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key;
  const CustomAppBar(
    this._key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: Color(0xfff8fafc),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 29,
            width: 175,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                'MAHMOUD',
                style: GoogleFonts.roboto(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              ButtonColor(true),
              SizedBox(
                width: 10,
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
