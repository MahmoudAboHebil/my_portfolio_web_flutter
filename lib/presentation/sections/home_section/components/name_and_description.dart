import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info_state.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';
import '../../../components/hover_animation_icon/hover_animation_icon.dart';

class NameAndDescription extends StatelessWidget {
  bool isBiggerLayout;

  NameAndDescription(this.isBiggerLayout);

  @override
  Widget build(BuildContext context) {
    return isBiggerLayout
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'MAHMOUD ABO HEBIL',
                      style: GoogleFonts.montserrat(
                        color: Provider.of<AppColors>(context).largeTextColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText('Mobile Application Developer',
                      textStyle: GoogleFonts.montserrat(
                        color: Provider.of<AppColors>(context).largeTextColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: Duration(milliseconds: 25),
                      textAlign: TextAlign.start),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'I\'m a programmer from Alexandria who loves crafting powerful applications that stand out. I specialize in using Flutter and native languages like Java & Kotlin.',
                        style: GoogleFonts.montserrat(
                          color: Provider.of<AppColors>(context).text1Color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<CubitInfo, CubitInfoState>(
                bloc: BlocProvider.of<CubitInfo>(context),
                builder: (context, state) {
                  if (state is LoadedData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        HoverAnimationIcon(Icons.facebook_outlined, 28,
                            state.info.facebookURL),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(
                            FontAwesomeIcons.github, 26, state.info.gitHupURL),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(FontAwesomeIcons.linkedin, 24,
                            state.info.linkedInURL),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        HoverAnimationIcon(Icons.facebook_outlined, 28, null),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(FontAwesomeIcons.github, 26, null),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(FontAwesomeIcons.linkedin, 24, null),
                      ],
                    );
                  }
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'MAHMOUD ABO HEBIL',
                        style: GoogleFonts.montserrat(
                          color: Provider.of<AppColors>(context).largeTextColor,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 65,
                alignment: Alignment.center,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Mobile Application Developer',
                        textStyle: GoogleFonts.montserrat(
                          color: Provider.of<AppColors>(context).largeTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: Duration(milliseconds: 25),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // width: 450,
                constraints: BoxConstraints(maxWidth: 480),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'I\'m a programmer from Alexandria who loves crafting powerful applications that stand out. I specialize in using Flutter and native languages like Java & Kotlin.',
                        style: GoogleFonts.montserrat(
                          color: Provider.of<AppColors>(context).text1Color,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<CubitInfo, CubitInfoState>(
                bloc: BlocProvider.of<CubitInfo>(context),
                builder: (context, state) {
                  if (state is LoadedData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HoverAnimationIcon(Icons.facebook_outlined, 28,
                            state.info.facebookURL),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(
                            FontAwesomeIcons.github, 26, state.info.gitHupURL),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(FontAwesomeIcons.linkedin, 24,
                            state.info.linkedInURL),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HoverAnimationIcon(Icons.facebook_outlined, 28, null),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(FontAwesomeIcons.github, 26, null),
                        SizedBox(
                          width: 20,
                        ),
                        HoverAnimationIcon(FontAwesomeIcons.linkedin, 24, null),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
            ],
          );
  }
}
