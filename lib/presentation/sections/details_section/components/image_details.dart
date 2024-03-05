import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_colors/app_colors.dart';

class ImageDetails extends StatefulWidget {
  final String imageUrl;
  final Size size;
  final int layout;

  ImageDetails(this.size, this.layout, this.imageUrl);

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  bool isHover = false;
  double getHight(int layout) {
    if (layout == 1) {
      return widget.size.width / 3.3;
    } else if (layout == 2) {
      return 280;
    } else {
      return widget.size.width / 2.5;
    }
  }

  double getWidth(int layout) {
    if (layout == 1) {
      return widget.size.width / 1.5;
    } else if (layout == 2) {
      return 650;
    } else {
      return widget.size.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(widget.layout),
      height: getHight(widget.layout),
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: Provider.of<AppColors>(context).isDarkState
            ? [
                BoxShadow(
                    color: Colors.white30,
                    blurRadius: 2,
                    spreadRadius: 0.1,
                    offset: Offset(1, 1))
              ]
            : [],
      ),
      child: Image.network(
        fit: BoxFit.cover,
        widget.imageUrl,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
