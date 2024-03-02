import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            // style: TextStyle(
            //   letterSpacing: 1.5,
            //   color: Colors.black,
            //   fontSize: 30,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        )
      ],
    );
  }
}
