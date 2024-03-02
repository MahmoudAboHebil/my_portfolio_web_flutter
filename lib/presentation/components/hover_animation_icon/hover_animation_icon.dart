import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_colors/app_colors.dart';

class HoverAnimationIcon extends StatefulWidget {
  IconData icon;
  double size;
  String Url;
  HoverAnimationIcon(this.icon, this.size, this.Url);
  @override
  State<HoverAnimationIcon> createState() => _HoverAnimationIconState();
}

class _HoverAnimationIconState extends State<HoverAnimationIcon> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (v) {
        setState(() {
          isHover = v;
        });
      },
      onTap: () {
        _launchUrl(widget.Url);
        setState(() {
          isHover = !isHover;
        });
      },
      child: AbsorbPointer(
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 25,
                width: 25,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                top: isHover ? -7 : 0,
                bottom: !isHover ? 0 : null,
                child: Icon(
                  widget.icon,
                  size: widget.size,
                  color: Provider.of<AppColors>(context).iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
