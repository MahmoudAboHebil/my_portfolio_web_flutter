import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../locator.dart';
import '../../app_colors/app_colors.dart';
import '../../components/section_title/section_title.dart';
import '../../routing/navigtion_service.dart';
import '../../routing/route_names.dart';
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
    locator<NavigationService>().navigatorTo(AboutRoute);
    streamController.add(1);
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

  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
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
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    style: GoogleFonts.montserrat(
                      color: Provider.of<AppColors>(context).textTitleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.mulish(
                      color: Provider.of<AppColors>(context).text1Color,
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
                          'Hello, I\'m Mahmoud Abo Hebil, a dedicated programmer passionate about crafting exceptional applications. With a strong foundation in Flutter and native programming languages like Java, I specialize in developing state-of-the-art apps that are robust, reliable, and user-friendly. By transforming creative ideas into practical software solutions, I strive to exceed expectations and deliver innovative experiences to users.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.mulish(
                              color: Provider.of<AppColors>(context).text1Color,
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
                        width: 340,
                        child: Column(
                          children: [
                            InfoTitle(title: 'Birthday:', text: '14/7/2000'),
                            InfoTitle(
                                title: 'Age:',
                                text: calculateAge(DateTime(2000, 7, 14))),
                            InfoTitle(
                                title: 'Address:',
                                text: 'Egypt, Alexandria, 21575'),
                            InfoTitle(
                                title: 'Email:',
                                text: 'mahmoudabohebil@gmail.com'),
                            InfoTitle(
                                title: 'Phone:', text: '+20 101 008 9357'),
                            InfoTitle(title: 'Freelance:', text: 'Available'),
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
                                    'Computer Science and Statistics at the Faculty of Science, Alexandria University'),
                            SizedBox(
                              height: 7,
                            ),
                            InfoTitle(
                                title: 'Degree:', text: 'Bachelor\'s Degree'),
                            InfoTitle(
                                title: 'Interest:',
                                text: 'Football, Chess, Reading'),
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
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 160,
                      color:
                          Provider.of<AppColors>(context).backgroundBox2Color,
                      child: Text(
                        'Download CV',
                        style: GoogleFonts.mulish(
                          color: Provider.of<AppColors>(context).text3Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
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
              color: Provider.of<AppColors>(context).text3Color,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(65, 70, 60, 70),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: GoogleFonts.montserrat(
                                    color: Provider.of<AppColors>(context)
                                        .backgroundBox2Color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('Dart', 97),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Java', 95),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Python', 85),
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
                                style: GoogleFonts.montserrat(
                                    color: Provider.of<AppColors>(context)
                                        .backgroundBox2Color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('Arabic', 95),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('English', 75),
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
              width: size.width > 1046 ? 900 : 775,
              child: Row(
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
                        InfoArro('Dart, Animation'),
                        InfoArro('State Management, GetX, BloC'),
                        InfoArro('SQLite, Firebase, Hive'),
                        InfoArro('API Integration, JSON'),
                        InfoArro('Shared preferences, Map'),
                        InfoArro('Provider, Notification'),
                        InfoArro('Postman, Figma'),
                        InfoArro('MangoDB, SQL'),
                        InfoArro('Java, Kotlin '),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  SizedBox(
                    width: 290,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Others',
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
                        InfoArro('Problem Solving'),
                        InfoArro('Testing and Debugging'),
                        InfoArro('Error handling'),
                        InfoArro('Clean Code'),
                        InfoArro('Deep OOP understanding'),
                        InfoArro('Version control (Git)'),
                        InfoArro('Active Listening'),
                        InfoArro('Always open to learning'),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              color: Provider.of<AppColors>(context).text3Color,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(65, 70, 60, 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: YearExp(
                        'Education',
                        '2018',
                        'Abbas Helmy Secondary School',
                        'High school diploma | 92.4%'),
                  ),
                  Expanded(
                    child: YearExp(
                        'Education',
                        '2024',
                        'Faculty of Science, Alexandria University',
                        'Computer Science and Statistics\nGraduation Project A-\nBachelor\'s Degree | GPA: 2.92'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 800,
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
                    style: GoogleFonts.montserrat(
                      color: Provider.of<AppColors>(context).textTitleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.mulish(
                      color: Provider.of<AppColors>(context).text1Color,
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
                          'Hello, I\'m Mahmoud Abo Hebil, a dedicated programmer passionate about crafting exceptional applications. With a strong foundation in Flutter and native programming languages like Java, I specialize in developing state-of-the-art apps that are robust, reliable, and user-friendly. By transforming creative ideas into practical software solutions, I strive to exceed expectations and deliver innovative experiences to users.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.mulish(
                              color: Provider.of<AppColors>(context).text1Color,
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
                              width: 340,
                              child: Column(
                                children: [
                                  InfoTitle(
                                      title: 'Birthday:', text: '14/7/2000'),
                                  InfoTitle(
                                      title: 'Age:',
                                      text:
                                          calculateAge(DateTime(2000, 7, 14))),
                                  InfoTitle(
                                      title: 'Address:',
                                      text: 'Egypt, Alexandria, 21575'),
                                  InfoTitle(
                                      title: 'Email:',
                                      text: 'mahmoudabohebil@gmail.com'),
                                  InfoTitle(
                                      title: 'Phone:',
                                      text: '+20 101 008 9357'),
                                  InfoTitle(
                                      title: 'Freelance:', text: 'Available'),
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
                                          'Computer Science and Statistics at the Faculty of Science, Alexandria University'),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  InfoTitle(
                                      title: 'Degree:',
                                      text: 'Bachelor\'s Degree'),
                                  InfoTitle(
                                      title: 'Interest:',
                                      text: 'Football, Chess, Reading'),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 340,
                              child: Column(
                                children: [
                                  InfoTitle(
                                      title: 'Birthday:', text: '14/7/2000'),
                                  InfoTitle(
                                      title: 'Age:',
                                      text:
                                          calculateAge(DateTime(2000, 7, 14))),
                                  InfoTitle(
                                      title: 'Address:',
                                      text: 'Egypt, Alexandria, 21575'),
                                  InfoTitle(
                                      title: 'Email:',
                                      text: 'mahmoudabohebil@gmail.com'),
                                  InfoTitle(
                                      title: 'Phone:',
                                      text: '+20 101 008 9357'),
                                  InfoTitle(
                                      title: 'Freelance:', text: 'Available'),
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
                                          'Computer Science and Statistics at the Faculty of Science, Alexandria University'),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  InfoTitle(
                                      title: 'Degree:',
                                      text: 'Bachelor\'s Degree'),
                                  InfoTitle(
                                      title: 'Interest:',
                                      text: 'Football, Chess, Reading'),
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
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 160,
                      color:
                          Provider.of<AppColors>(context).backgroundBox2Color,
                      child: Text(
                        'Download CV',
                        style: GoogleFonts.mulish(
                          color: Provider.of<AppColors>(context).text3Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
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
                    color: Provider.of<AppColors>(context).text3Color,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      style: GoogleFonts.montserrat(
                                          color: Provider.of<AppColors>(context)
                                              .backgroundBox2Color,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('Dart', 97),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Java', 95),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Python', 85),
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
                                      style: GoogleFonts.montserrat(
                                          color: Provider.of<AppColors>(context)
                                              .backgroundBox2Color,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('Arabic', 95),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('English', 75),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Provider.of<AppColors>(context).text3Color,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('Dart', 97),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Java', 95),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('Python', 85),
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
                                      style: GoogleFonts.montserrat(
                                          color: Provider.of<AppColors>(context)
                                              .backgroundBox2Color,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  ExpPercent('Arabic', 95),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ExpPercent('English', 75),
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
                    width: 800,

                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
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
                              InfoArro('Dart, Animation'),
                              InfoArro('State Management, GetX, BloC'),
                              InfoArro('SQLite, Firebase, Hive'),
                              InfoArro('API Integration, JSON'),
                              InfoArro('Shared preferences, Map'),
                              InfoArro('Provider, Notification'),
                              InfoArro('Postman, Figma'),
                              InfoArro('MangoDB, SQL'),
                              InfoArro('Java, Kotlin '),
                            ],
                          ),
                        ),
                        Spacer(flex: 2),
                        SizedBox(
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Others',
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
                              InfoArro('Problem Solving'),
                              InfoArro('Testing and Debugging'),
                              InfoArro('Error handling'),
                              InfoArro('Clean Code'),
                              InfoArro('Deep OOP understanding'),
                              InfoArro('Version control (Git)'),
                              InfoArro('Active Listening'),
                              InfoArro('Always open to learning'),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              InfoArro('Dart, Animation'),
                              InfoArro('State Management, GetX, BloC'),
                              InfoArro('SQLite, Firebase, Hive'),
                              InfoArro('API Integration, JSON'),
                              InfoArro('Shared preferences, Map'),
                              InfoArro('Provider, Notification'),
                              InfoArro('Postman, Figma'),
                              InfoArro('MangoDB, SQL'),
                              InfoArro('Java, Kotlin '),
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
                                  'Others',
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
                              InfoArro('Problem Solving'),
                              InfoArro('Testing and Debugging'),
                              InfoArro('Error handling'),
                              InfoArro('Clean Code'),
                              InfoArro('Deep OOP understanding'),
                              InfoArro('Version control (Git)'),
                              InfoArro('Active Listening'),
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
                    color: Provider.of<AppColors>(context).text3Color,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: YearExp(
                              'Education',
                              '2018',
                              'Abbas Helmy Secondary School',
                              'High school diploma | 92.4%'),
                        ),
                        Expanded(
                          child: YearExp(
                              'Education',
                              '2024',
                              'Faculty of Science, Alexandria University',
                              'Computer Science and Statistics\nGraduation Project A-\nBachelor\'s Degree | GPA: 2.92'),
                        ),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    color: Provider.of<AppColors>(context).text3Color,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        YearExp(
                            'Education',
                            '2018',
                            'Abbas Helmy Secondary School',
                            'High school diploma | 92.4%'),
                        SizedBox(
                          height: 50,
                        ),
                        YearExp(
                            'Education',
                            '2024',
                            'Faculty of Science, Alexandria University',
                            'Computer Science and Statistics\nGraduation Project A-\nBachelor\'s Degree | GPA: 2.92'),
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
                    style: GoogleFonts.montserrat(
                      color: Provider.of<AppColors>(context).textTitleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Application Developer',
                    style: GoogleFonts.mulish(
                      color: Provider.of<AppColors>(context).text1Color,
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
                          'Hello, I\'m Mahmoud Abo Hebil, a dedicated programmer passionate about crafting exceptional applications. With a strong foundation in Flutter and native programming languages like Java, I specialize in developing state-of-the-art apps that are robust, reliable, and user-friendly. By transforming creative ideas into practical software solutions, I strive to exceed expectations and deliver innovative experiences to users.\n\nI love learning and researching, and i am interested in everything new about software.',
                          style: GoogleFonts.mulish(
                              color: Provider.of<AppColors>(context).text1Color,
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
                        width: 340,
                        child: Column(
                          children: [
                            InfoTitle(title: 'Birthday:', text: '14/7/2000'),
                            InfoTitle(
                                title: 'Age:',
                                text: calculateAge(DateTime(2000, 7, 14))),
                            InfoTitle(
                                title: 'Address:',
                                text: 'Egypt, Alexandria, 21575'),
                            InfoTitle(
                                title: 'Email:',
                                text: 'mahmoudabohebil@gmail.com'),
                            InfoTitle(
                                title: 'Phone:', text: '+20 101 008 9357'),
                            InfoTitle(title: 'Freelance:', text: 'Available'),
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
                                    'Computer Science and Statistics at the Faculty of Science, Alexandria University'),
                            SizedBox(
                              height: 7,
                            ),
                            InfoTitle(
                                title: 'Degree:', text: 'Bachelor\'s Degree'),
                            InfoTitle(
                                title: 'Interest:',
                                text: 'Football, Chess, Reading'),
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
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 160,
                      color:
                          Provider.of<AppColors>(context).backgroundBox2Color,
                      child: Text(
                        'Download CV',
                        style: GoogleFonts.mulish(
                          color: Provider.of<AppColors>(context).text3Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
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
              color: Provider.of<AppColors>(context).text3Color,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: GoogleFonts.montserrat(
                                    color: Provider.of<AppColors>(context)
                                        .backgroundBox2Color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('Dart', 97),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Java', 95),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('Python', 85),
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
                                style: GoogleFonts.montserrat(
                                    color: Provider.of<AppColors>(context)
                                        .backgroundBox2Color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            ExpPercent('Arabic', 95),
                            SizedBox(
                              height: 30,
                            ),
                            ExpPercent('English', 75),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        InfoArro('Dart, Animation'),
                        InfoArro('State Management, GetX, BloC'),
                        InfoArro('SQLite, Firebase, Hive'),
                        InfoArro('API Integration, JSON'),
                        InfoArro('Shared preferences, Map'),
                        InfoArro('Provider, Notification'),
                        InfoArro('Postman, Figma'),
                        InfoArro('MangoDB, SQL'),
                        InfoArro('Java, Kotlin '),
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
                            'Others',
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
                        InfoArro('Problem Solving'),
                        InfoArro('Testing and Debugging'),
                        InfoArro('Error handling'),
                        InfoArro('Clean Code'),
                        InfoArro('Deep OOP understanding'),
                        InfoArro('Version control (Git)'),
                        InfoArro('Active Listening'),
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
              color: Provider.of<AppColors>(context).text3Color,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  YearExp('Education', '2018', 'Abbas Helmy Secondary School',
                      'High school diploma | 92.4%'),
                  SizedBox(
                    height: 50,
                  ),
                  YearExp(
                      'Education',
                      '2024',
                      'Faculty of Science, Alexandria University',
                      'Computer Science and Statistics\nGraduation Project A-\nBachelor\'s Degree | GPA: 2.92'),
                ],
              ),
            ),
            SizedBox(
              height: 60,
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
            color: Provider.of<AppColors>(context).backgroundColor,
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
