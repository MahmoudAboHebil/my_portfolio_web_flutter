import 'package:flutter/material.dart';

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
        // image: DecorationImage(
        //   alignment: Alignment.topCenter,
        //   fit: BoxFit.cover,
        //   image: NetworkImage(
        //     widget.imageUrl,
        //   ),
        // ),
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
