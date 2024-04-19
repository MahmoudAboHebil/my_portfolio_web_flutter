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
                  alignment: Alignment.topCenter,
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          state.info.aboutImageURL,
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.indigo,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  constraints: BoxConstraints(
                      maxHeight: size.width / 2.2, maxWidth: size.height / 0.5),
                  alignment: Alignment.topCenter,
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          state.info.aboutImageURL,
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.indigo,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
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
