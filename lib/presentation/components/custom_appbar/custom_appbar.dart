import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../button_color/button_color.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key;
  final bool removeSitting;
  const CustomAppBar(
    this.removeSitting,
    this._key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      color: Provider.of<AppColors>(context).backgroundBox6Color,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 29,
            width: 175,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                'MAHMOUD',
                style: GoogleFonts.montserrat(
                  letterSpacing: 1.5,
                  color: Provider.of<AppColors>(context).iconColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonColor(true),
              removeSitting
                  ? SizedBox()
                  : SizedBox(
                      width: 10,
                    ),
              removeSitting
                  ? SizedBox()
                  : IconButton(
                      padding: EdgeInsets.only(bottom: 1),
                      iconSize: 30,
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Provider.of<AppColors>(context).iconColor,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
