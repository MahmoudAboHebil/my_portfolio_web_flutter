import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/section_title/section_title.dart';
import 'components/card_fun_fact.dart';
import 'components/card_service.dart';

class ServiceSection extends StatefulWidget {
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

  Widget serviceContent(Size size) {
    if (size.width >= 1046) {
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardService(
                            '01',
                            'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                            'Bulid Web Site'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: CardService(
                            '02',
                            'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                            'Bulid Web Site'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Fun Facts',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decorationThickness: BorderSide.strokeAlignOutside),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardFunFact('6', 'Projects Completed'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: CardFunFact('5K+', 'Lines of Code'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    } else if (size.width < 1046 && size.width >= 650) {
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
                  SizedBox(
                    height: 30,
                  ),
                  size.width >= 750
                      ? Row(
                          children: [
                            Expanded(
                              child: CardService(
                                  '01',
                                  'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                                  'Bulid Web Site'),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CardService(
                                  '02',
                                  'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                                  'Bulid Web Site'),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CardService(
                                '01',
                                'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                                'Bulid Web Site'),
                            SizedBox(
                              height: 30,
                            ),
                            CardService(
                                '02',
                                'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                                'Bulid Web Site'),
                          ],
                        ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Fun Facts',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decorationThickness: BorderSide.strokeAlignOutside),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  size.width >= 750
                      ? Row(
                          children: [
                            Expanded(
                              child: CardFunFact('6', 'Projects Completed'),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CardFunFact('5K+', 'Lines of Code'),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CardFunFact('6', 'Projects Completed'),
                            SizedBox(
                              height: 30,
                            ),
                            CardFunFact('5K+', 'Lines of Code'),
                          ],
                        ),
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
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      CardService(
                          '01',
                          'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                          'Bulid Web Site'),
                      SizedBox(
                        height: 30,
                      ),
                      CardService(
                          '02',
                          'I build front-end websites from scratch, whatever you want with the latest tools, and it is easy, fast, and smooth. I can make any changes you want, any sites you want, whether it is private sites, for a company, or for your stores.',
                          'Bulid Web Site'),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Fun Facts',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decorationThickness: BorderSide.strokeAlignOutside),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Column(
                    children: [
                      CardFunFact('6', 'Projects Completed'),
                      SizedBox(
                        height: 30,
                      ),
                      CardFunFact('5K+', 'Lines of Code'),
                    ],
                  )
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
            color: Color(0xfff5f5f4),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: serviceContent(size),
          ),
        ),
      ),
    );
  }
}
