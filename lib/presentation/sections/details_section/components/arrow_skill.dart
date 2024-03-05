import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

class ArrowSkill extends StatelessWidget {
  final String skill;
  const ArrowSkill({
    required this.skill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_right,
          size: 24,
          color: Provider.of<AppColors>(context).backgroundBox2Color,
        ),
        SizedBox(
          width: 1,
        ),
        Text(
          skill,
          style: GoogleFonts.montserrat(
            color: Provider.of<AppColors>(context).text1Color,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
