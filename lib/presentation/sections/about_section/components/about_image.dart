import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit_info/cubit_info.dart';
import '../../../../logic/cubit_info/cubit_info_state.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({
    super.key,
    required this.size,
    required this.isBiggerLayout,
  });

  final Size size;
  final bool isBiggerLayout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitInfo, CubitInfoState>(
      bloc: BlocProvider.of<CubitInfo>(context),
      builder: (context, state) {
        if (state is LoadedData) {
          return isBiggerLayout
              ? Container(
                  constraints: BoxConstraints(
                      maxHeight: size.width / 2.6,
                      maxWidth: size.height / 0.001),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        state.info.aboutImageURL,
                      ),
                    ),
                  ),
                )
              : Container(
                  constraints: BoxConstraints(
                      maxHeight: size.width / 2.2, maxWidth: size.height / 0.5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                        state.info.aboutImageURL,
                      ),
                    ),
                  ),
                );
        } else {
          return Center(
            child: Image.asset('assets/images/loading2.gif', width: 70),
          );
        }
      },
    );
  }
}
//  'assets/images/portfolio/img1.jpg',
