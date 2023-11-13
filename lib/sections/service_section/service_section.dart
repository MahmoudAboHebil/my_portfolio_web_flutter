import 'dart:async';
import 'package:flutter/material.dart';
import '../../components/section_title/section_title.dart';

class ServiceSection extends StatefulWidget {
  Size size;
  ServiceSection(this.size);

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
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

  Widget serviceContent() {
    if (widget.size.width >= 1046) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('What I Do', 'SERVICE', 60, 30),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (widget.size.width < 1046 && widget.size.width >= 650) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle('What I Do', 'SERVICE', 60, 28),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SectionTitle('What I Do', 'SERVICE', 60, 20),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(-0.1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: Container(
          color: Color(0xfff5f5f4),
          alignment: Alignment.topLeft,
          child: serviceContent(),
        ),
      ),
    );
  }
}
