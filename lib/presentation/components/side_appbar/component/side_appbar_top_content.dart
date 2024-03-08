import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';

class SideAppBarTopContent extends StatelessWidget {
  SideAppBarTopContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     IconButton(
        //       onPressed: () {
        //         callBackToClose();
        //       },
        //       icon: Icon(
        //         Icons.close,
        //         color: Colors.black,
        //         size: 30,
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 29,
          width: 175,
          child: Text(
            'MAHMOUD',
            style: GoogleFonts.montserrat(
              letterSpacing: 1.3,
              color: Provider.of<AppColors>(context).largeTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
