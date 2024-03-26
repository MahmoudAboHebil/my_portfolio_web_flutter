import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info.dart';
import 'package:portfolio_2/logic/cubit_info/cubit_info_state.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> {
  List<BorderRadius> borderRadius = [
    // BorderRadius.circular(1000),
    BorderRadius.only(
      topLeft: Radius.circular(50 * 3),
      topRight: Radius.circular(70 * 3),
      bottomRight: Radius.circular(50 * 3),
      bottomLeft: Radius.circular(70 * 3),
    ),
    BorderRadius.only(
      topLeft: Radius.circular(70 * 3),
      topRight: Radius.circular(50 * 3),
      bottomRight: Radius.circular(70 * 3),
      bottomLeft: Radius.circular(50 * 3),
    ),
  ];
  bool isHover = false;
  int index = 0;
  Timer? _timer;
  Duration duration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          index = (index + 1) % borderRadius.length;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitInfo, CubitInfoState>(
      bloc: BlocProvider.of<CubitInfo>(context),
      builder: (context, state) {
        if (state is LoadedData) {
          return InkWell(
            onTap: () {
              setState(() {
                isHover = !isHover;
              });
            },
            child: AnimatedContainer(
              duration: duration,
              curve: Curves.linear,
              height: 300,
              width: 300,
              // constraints: BoxConstraints(maxHeight: size.height, minHeight: 700),
              decoration: BoxDecoration(
                color: Provider.of<AppColors>(context).imageBorderColor,
                border: Border.all(
                    color: Provider.of<AppColors>(context).imageBorderColor,
                    width: 10),
                borderRadius: borderRadius[index],
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    state.info.homeImageURL,
                  ),
                ),
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: () {
              setState(() {
                isHover = !isHover;
              });
            },
            child: AnimatedContainer(
              duration: duration,
              curve: Curves.linear,
              height: 300,
              width: 300,
              child: Center(
                child: Image.asset('assets/images/loading2.gif', width: 70),
              ),
            ),
          );
        }
      },
    );
  }
}
// 'assets/images/portfolio/img5.jpg',
