import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio_2/components/section_title/section_title.dart';
import 'package:portfolio_2/sections/home_section/components/animated_image.dart';
import 'package:portfolio_2/sections/home_section/components/name_and_description.dart';

import 'components/about_image.dart';

///todo: fix the padding or margin around wight box
class AboutSection extends StatefulWidget {
  Size size;
  AboutSection(this.size);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    Timer(
      Duration(milliseconds: 300),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  Widget aboutContent() {
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
                  SizedBox(
                    height: 30,
                  ),
                  SectionTitle('About Me', 'ABOUT', 60, 30),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: widget.size,
                    isBiggerLayout: true,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Mahmoud Abo Hebill',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Hi, my name is Mahmoud AboHebil, and I\'ve been getting to know programming, website development, construction, and React.js.I\'ve spent most of my time learning and building websites in my specialties building up state-of-the-art Web sites through React.js.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              height: 1.8,
                              fontSize: 16,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 320,
                        child: Column(
                          children: [
                            InfoTitle(title: 'Birthday:', text: '15/2/2004'),
                            InfoTitle(title: 'Age:', text: '23'),
                            InfoTitle(
                                title: 'Address:',
                                text: 'Jenicles 27, Alexandria , EG'),
                            InfoTitle(
                                title: 'Email:',
                                text: 'abdelfattah.busine@gmail.com'),
                            InfoTitle(title: 'Phone:', text: '+20 01210015280'),
                            InfoTitle(title: 'Freelance', text: 'Available'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 330,
                        child: Column(
                          children: [
                            InfoTitle(title: 'Nationality:', text: 'Egyptian'),
                            SizedBox(
                              height: 7,
                            ),
                            InfoTitle(
                                title: 'Study:',
                                text:
                                    'Computer science and Statistics \nFaculty of Science, Alexandria \nUniversity'),
                            SizedBox(
                              height: 7,
                            ),
                            InfoTitle(
                                title: 'Degree:', text: 'high school diploma'),
                            InfoTitle(
                                title: 'Interest:',
                                text: 'Boxing, Chess, Reading'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 160,
                    color: Colors.black,
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Programming Skills',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('Html_Css', 97),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('JavaScript', 85),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('React', 90),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Language Skills',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('English', 70),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Arabic', 95),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Japanese', 45),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Knowledge',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InfoArro('Bootstrap,React-bootstrap'),
                        InfoArro('TailwindCss'),
                        InfoArro('Material-Ui'),
                        InfoArro('GitHub'),
                        InfoArro('React router'),
                        InfoArro('React redux,Redux Toolkit'),
                        InfoArro('React'),
                        InfoArro('vite'),
                        InfoArro('Next.js'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Interests',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InfoArro('UI/UX Design'),
                        InfoArro('Create Mobile App'),
                        InfoArro('Site Optimization'),
                        InfoArro('Learn Ecommerce'),
                        InfoArro('Custom Website'),
                        InfoArro('Learn new things'),
                        InfoArro('Volunteer work'),
                        InfoArro('Love of research'),
                        InfoArro('Always open to learning'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  YearExp('Education', '2020 - 2023',
                      'Al-Shatbi Mechanical\nSecondary', 'High school diploma'),
                  YearExp('Education', '2020 - 2023',
                      'Al-Shatbi Mechanical\nSecondary', 'High school diploma'),
                ],
              ),
            ),
            SizedBox(
              height: 1000,
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
                  SectionTitle('About Me', 'ABOUT', 60, 28),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: widget.size,
                    isBiggerLayout: false,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Mahmoud Abo Hebill',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Hi, my name is Mahmoud AboHebil, and I\'ve been getting to know programming, website development, construction, and React.js.I\'ve spent most of my time learning and building websites in my specialties building up state-of-the-art Web sites through React.js.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              height: 1.8,
                              fontSize: 16,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  widget.size.width >= 750
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 320,
                              child: Column(
                                children: [
                                  InfoTitle(
                                      title: 'Birthday:', text: '15/2/2004'),
                                  InfoTitle(title: 'Age:', text: '23'),
                                  InfoTitle(
                                      title: 'Address:',
                                      text: 'Jenicles 27, Alexandria , EG'),
                                  InfoTitle(
                                      title: 'Email:',
                                      text: 'abdelfattah.busine@gmail.com'),
                                  InfoTitle(
                                      title: 'Phone:', text: '+20 01210015280'),
                                  InfoTitle(
                                      title: 'Freelance', text: 'Available'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 330,
                              child: Column(
                                children: [
                                  InfoTitle(
                                      title: 'Nationality:', text: 'Egyptian'),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  InfoTitle(
                                      title: 'Study:',
                                      text:
                                          'Computer science and Statistics \nFaculty of Science, Alexandria \nUniversity'),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  InfoTitle(
                                      title: 'Degree:',
                                      text: 'high school diploma'),
                                  InfoTitle(
                                      title: 'Interest:',
                                      text: 'Boxing, Chess, Reading'),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 320,
                              child: Column(
                                children: [
                                  InfoTitle(
                                      title: 'Birthday:', text: '15/2/2004'),
                                  InfoTitle(title: 'Age:', text: '23'),
                                  InfoTitle(
                                      title: 'Address:',
                                      text: 'Jenicles 27, Alexandria , EG'),
                                  InfoTitle(
                                      title: 'Email:',
                                      text: 'abdelfattah.busine@gmail.com'),
                                  InfoTitle(
                                      title: 'Phone:', text: '+20 01210015280'),
                                  InfoTitle(
                                      title: 'Freelance', text: 'Available'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 330,
                              child: Column(
                                children: [
                                  InfoTitle(
                                      title: 'Nationality:', text: 'Egyptian'),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  InfoTitle(
                                      title: 'Study:',
                                      text:
                                          'Computer science and Statistics \nFaculty of Science, Alexandria \nUniversity'),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  InfoTitle(
                                      title: 'Degree:',
                                      text: 'high school diploma'),
                                  InfoTitle(
                                      title: 'Interest:',
                                      text: 'Boxing, Chess, Reading'),
                                ],
                              ),
                            ),
                          ],
                        ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 160,
                    color: Colors.black,
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            widget.size.width >= 750
                ? Container(
                    // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    alignment: Alignment.center,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Programming Skills',
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('Html_Css', 97),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('JavaScript', 85),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('React', 90),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Language Skills',
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('English', 70),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Arabic', 95),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Japanese', 45),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Programming Skills',
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('Html_Css', 97),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('JavaScript', 85),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('React', 90),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Language Skills',
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('English', 70),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Arabic', 95),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Japanese', 45),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 40,
            ),
            widget.size.width >= 750
                ? Container(
                    // margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Knowledge',
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InfoArro('Bootstrap,React-bootstrap'),
                              InfoArro('TailwindCss'),
                              InfoArro('Material-Ui'),
                              InfoArro('GitHub'),
                              InfoArro('React router'),
                              InfoArro('React redux,Redux Toolkit'),
                              InfoArro('React'),
                              InfoArro('vite'),
                              InfoArro('Next.js'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Interests',
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InfoArro('UI/UX Design'),
                              InfoArro('Create Mobile App'),
                              InfoArro('Site Optimization'),
                              InfoArro('Learn Ecommerce'),
                              InfoArro('Custom Website'),
                              InfoArro('Learn new things'),
                              InfoArro('Volunteer work'),
                              InfoArro('Love of research'),
                              InfoArro('Always open to learning'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Knowledge',
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InfoArro('Bootstrap,React-bootstrap'),
                              InfoArro('TailwindCss'),
                              InfoArro('Material-Ui'),
                              InfoArro('GitHub'),
                              InfoArro('React router'),
                              InfoArro('React redux,Redux Toolkit'),
                              InfoArro('React'),
                              InfoArro('vite'),
                              InfoArro('Next.js'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Interests',
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InfoArro('UI/UX Design'),
                              InfoArro('Create Mobile App'),
                              InfoArro('Site Optimization'),
                              InfoArro('Learn Ecommerce'),
                              InfoArro('Custom Website'),
                              InfoArro('Learn new things'),
                              InfoArro('Volunteer work'),
                              InfoArro('Love of research'),
                              InfoArro('Always open to learning'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 40,
            ),
            widget.size.width >= 750
                ? Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        YearExp(
                            'Education',
                            '2020 - 2023',
                            'Al-Shatbi Mechanical\nSecondary',
                            'High school diploma'),
                        YearExp(
                            'Education',
                            '2020 - 2023',
                            'Al-Shatbi Mechanical\nSecondary',
                            'High school diploma'),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        YearExp(
                            'Education',
                            '2020 - 2023',
                            'Al-Shatbi Mechanical\nSecondary',
                            'High school diploma'),
                        SizedBox(
                          height: 50,
                        ),
                        YearExp(
                            'Education',
                            '2020 - 2023',
                            'Al-Shatbi Mechanical\nSecondary',
                            'High school diploma'),
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
                  SectionTitle('About Me', 'ABOUT', 60, 20),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: widget.size,
                    isBiggerLayout: false,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Mahmoud Abo Hebill',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Hi, my name is Mahmoud AboHebil, and I\'ve been getting to know programming, website development, construction, and React.js.I\'ve spent most of my time learning and building websites in my specialties building up state-of-the-art Web sites through React.js.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              height: 1.8,
                              fontSize: 16,
                              wordSpacing: 1.8),
                          maxLines: 15,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 320,
                        child: Column(
                          children: [
                            InfoTitle(title: 'Birthday:', text: '15/2/2004'),
                            InfoTitle(title: 'Age:', text: '23'),
                            InfoTitle(
                                title: 'Address:',
                                text: 'Jenicles 27, Alexandria , EG'),
                            InfoTitle(
                                title: 'Email:',
                                text: 'abdelfattah.busine@gmail.com'),
                            InfoTitle(title: 'Phone:', text: '+20 01210015280'),
                            InfoTitle(title: 'Freelance', text: 'Available'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 330,
                        child: Column(
                          children: [
                            InfoTitle(title: 'Nationality:', text: 'Egyptian'),
                            SizedBox(
                              height: 7,
                            ),
                            InfoTitle(
                                title: 'Study:',
                                text:
                                    'Computer science and Statistics \nFaculty of Science, Alexandria \nUniversity'),
                            SizedBox(
                              height: 7,
                            ),
                            InfoTitle(
                                title: 'Degree:', text: 'high school diploma'),
                            InfoTitle(
                                title: 'Interest:',
                                text: 'Boxing, Chess, Reading'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.grey.shade500,
                      thickness: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 160,
                    color: Colors.black,
                    child: Text(
                      'Download CV',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Programming Skills',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('Html_Css', 97),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('JavaScript', 85),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('React', 90),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Language Skills',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('English', 70),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Arabic', 95),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Japanese', 45),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                children: [
                  SizedBox(
                    width: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Knowledge',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InfoArro('Bootstrap,React-bootstrap'),
                        InfoArro('TailwindCss'),
                        InfoArro('Material-Ui'),
                        InfoArro('GitHub'),
                        InfoArro('React router'),
                        InfoArro('React redux,Redux Toolkit'),
                        InfoArro('React'),
                        InfoArro('vite'),
                        InfoArro('Next.js'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Interests',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InfoArro('UI/UX Design'),
                        InfoArro('Create Mobile App'),
                        InfoArro('Site Optimization'),
                        InfoArro('Learn Ecommerce'),
                        InfoArro('Custom Website'),
                        InfoArro('Learn new things'),
                        InfoArro('Volunteer work'),
                        InfoArro('Love of research'),
                        InfoArro('Always open to learning'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  YearExp('Education', '2020 - 2023',
                      'Al-Shatbi Mechanical\nSecondary', 'High school diploma'),
                  SizedBox(
                    height: 50,
                  ),
                  YearExp('Education', '2020 - 2023',
                      'Al-Shatbi Mechanical\nSecondary', 'High school diploma'),
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
          child: aboutContent(),
        ),
      ),
    );
  }
}

class YearExp extends StatelessWidget {
  String title;
  String year;
  String mainExp;
  String extraInfo;

  YearExp(this.title, this.year, this.mainExp, this.extraInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.4,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 2,
                  height: 150,
                  color: Color(0xffdee3e9),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffdee3e9), width: 1),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xffeaecef),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Text(
                year,
                style: GoogleFonts.roboto(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    wordSpacing: 1.8,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainExp,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                      wordSpacing: 1.6),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  extraInfo,
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade800,
                      fontSize: 14,
                      wordSpacing: 1.8,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class InfoArro extends StatelessWidget {
  final String text;

  InfoArro(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Transform.rotate(
            angle: 180 * pi / 180,
            child: Image.asset(
              'assets/images/arrowIcon.png',
              width: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.roboto(
                color: Colors.grey.shade700,
                fontSize: 16,
                wordSpacing: 1.8,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class ExpPercent extends StatelessWidget {
  String title;
  int percent;

  ExpPercent(this.title, this.percent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
              ),
              Text(
                '$percent%',
                style: GoogleFonts.roboto(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        LinearPercentIndicator(
          lineHeight: 4,
          percent: percent / 100.0,
          backgroundColor: Colors.grey,
          progressColor: Colors.black,
        ),
      ],
    );
  }
}

class InfoTitle extends StatelessWidget {
  InfoTitle({
    required this.title,
    required this.text,
    super.key,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            text,
            style: GoogleFonts.roboto(
                color: Colors.grey.shade800,
                fontSize: 16,
                wordSpacing: 1.8,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

// Stack(
//   clipBehavior: Clip.none,
//   alignment: Alignment.centerLeft,
//   children: [
//     Container(
//       height: 400,
//       width: double.infinity,
//     ),
//     Positioned(
//       height: 400,
//       left: -80,
//       child: Container(
//         alignment: Alignment.center,
//         width: 1100,
//         color: Colors.white,
//         child: Container(
//           width: 500,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(right: 50),
//                   child: LinearPercentIndicator(
//                     lineHeight: 14.0,
//                     percent: 0.5,
//                     backgroundColor: Colors.grey,
//                     progressColor: Colors.blue,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   child: LinearPercentIndicator(
//                     lineHeight: 14.0,
//                     percent: 0.5,
//                     backgroundColor: Colors.grey,
//                     progressColor: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     )
//   ],
// ),
