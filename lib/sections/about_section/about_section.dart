import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio_2/components/section_title/section_title.dart';
import 'package:portfolio_2/sections/home_section/components/animated_image.dart';
import 'package:portfolio_2/sections/home_section/components/name_and_description.dart';

import 'components/about_image.dart';
import 'components/exp_percent.dart';
import 'components/info_arro.dart';
import 'components/info_title.dart';
import 'components/year_exp.dart';

///todo: fix the padding or margin around wight box
class AboutSection extends StatefulWidget {
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
    _animationController.dispose();

    super.dispose();
  }

  Widget aboutContent(Size size) {
    if (size.width >= 1046) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              width: size.width > 1046 ? 900 : 775,
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
                    size: size,
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
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(65, 70, 60, 70),

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
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(65, 70, 60, 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: YearExp(
                        'Education',
                        '2020 - 2023',
                        'Al-Shatbi Mechanical Secondary',
                        'High school diploma'),
                  ),
                  Expanded(
                    child: YearExp(
                        'Education',
                        '2020 - 2023',
                        'Al-Shatbi Mechanical Secondary',
                        'High school diploma'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
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
                  SectionTitle('About Me', 'ABOUT', 60, 28),
                  SizedBox(
                    height: 30,
                  ),
                  AboutImage(
                    size: size,
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
                  size.width >= 750
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
            size.width >= 750
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
            size.width >= 750
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
            size.width >= 750
                ? Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: YearExp(
                              'Education',
                              '2020 - 2023',
                              'Al-Shatbi Mechanical Secondary',
                              'High school diploma'),
                        ),
                        Expanded(
                          child: YearExp(
                              'Education',
                              '2020 - 2023',
                              'Al-Shatbi Mechanical Secondary',
                              'High school diploma'),
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
                        YearExp(
                            'Education',
                            '2020 - 2023',
                            'Al-Shatbi Mechanical Secondary',
                            'High school diploma'),
                        SizedBox(
                          height: 50,
                        ),
                        YearExp(
                            'Education',
                            '2020 - 2023',
                            'Al-Shatbi Mechanical Secondary',
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
                    size: size,
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
                      'Al-Shatbi Mechanical Secondary', 'High school diploma'),
                  SizedBox(
                    height: 50,
                  ),
                  YearExp('Education', '2020 - 2023',
                      'Al-Shatbi Mechanical Secondary', 'High school diploma'),
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
            alignment: Alignment.center,
            child: aboutContent(size),
          ),
        ),
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
