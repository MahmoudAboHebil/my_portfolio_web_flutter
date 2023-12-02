import 'package:flutter/material.dart';

class HoverAnimationIcon extends StatefulWidget {
  IconData icon;
  double size;
  HoverAnimationIcon(this.icon, this.size);
  @override
  State<HoverAnimationIcon> createState() => _HoverAnimationIconState();
}

class _HoverAnimationIconState extends State<HoverAnimationIcon> {
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
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
