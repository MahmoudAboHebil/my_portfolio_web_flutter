import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
import '../../app_colors/app_colors.dart';
import '../../routing/navigtion_service.dart';
import '../../routing/route_names.dart';
import 'components/animated_image.dart';
import 'components/name_and_description.dart';

class HomeSection extends StatefulWidget {
  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  @override
  void initState() {
    locator<NavigationService>().navigatorTo(HomeRoute);
    streamController.add(0);

    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    );
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    Timer(
      Duration(milliseconds: 200),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      primary: true,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-0.1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: Container(
            alignment: Alignment.center,
            color: Provider.of<AppColors>(context).backgroundColor,
            width: 900,
            child: size.width > 775
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    height: 620,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedImage(),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: NameAndDescription(true),
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    width: 450,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedImage(),
                        SizedBox(
                          height: 30,
                        ),
                        NameAndDescription(false),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
