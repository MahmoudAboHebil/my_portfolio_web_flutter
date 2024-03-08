import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors extends ChangeNotifier {
  bool isDarkState = false;
  Color backgroundColor = Color(0xfff5f5f4);
  Color shadowColor = Color.fromRGBO(0, 0, 0, .1);
  Color backgroundIndColor = Color(0xff9ca3af);
  Color backgroundBoxColor = Color(0xffd8dbe0);
  Color backgroundBox2Color = Colors.black;
  Color backgroundBox3Color = Color(0xffdadde2);
  Color backgroundBox4Color = Colors.white;
  Color backgroundBox5Color = Color(0xfff8fafc);
  Color backgroundBox6Color = Colors.white;
  Color text1Color = Color(0xff485563);
  Color text2Color = Color(0xff1f2937);
  Color text3Color = Colors.white;
  Color text4Color = Color(0xff9ca3af);
  Color text5Color = Color(0xff4b5563);
  Color text6Color = Color(0xff1f2937);
  Color text7Color = Color(0xffe5e7eb);
  Color text8Color = Color.fromRGBO(148, 163, 184, .7);
  Color text9Color = Colors.grey.shade500.withOpacity(0.9);
  Color text10Color = Color.fromRGBO(63, 63, 70, .8);
  Color indColor = Colors.black;
  Color largeTextColor = Colors.black;
  Color textTitleColor = Colors.black;
  Color iconColor = Colors.black;
  Color boxBorder = Color(0xffd7d7d7);
  Color boxBorder2 = Color(0xffc4c4c3);
  Color boxBorder3 = Color.fromRGBO(156, 163, 175, .5);
  Color imageBorderColor = Colors.grey.shade300.withOpacity(0.5);
  void setColorMode(bool isDarkMode) {
    isDarkState = isDarkMode;
    backgroundColor =
        isDarkMode ? Color.fromRGBO(33, 33, 33, 1) : Color(0xfff5f5f4);
    text1Color = isDarkMode ? Color(0xff9ca3af) : Color(0xff485563);
    boxBorder = isDarkMode ? Color.fromRGBO(75, 85, 99, 1) : Color(0xffd7d7d7);
    boxBorder2 = isDarkMode ? Color(0xff7e7e7e) : Color(0xffc4c4c3);
    boxBorder3 =
        isDarkMode ? Color(0xff7e7e7e) : Color.fromRGBO(156, 163, 175, .5);
    shadowColor = isDarkMode
        ? Color.fromRGBO(100, 116, 139, .2)
        : Color.fromRGBO(0, 0, 0, .1);
    largeTextColor = isDarkMode ? Color(0xfff8fafc) : Colors.black;
    iconColor = isDarkMode ? Color(0xfff8fafc) : Colors.black;
    textTitleColor = isDarkMode ? Color(0xfffafafa) : Colors.black;
    text2Color = isDarkMode ? Color(0xffd4d4d4e6) : Color(0xff1f2937);
    text3Color = isDarkMode ? Colors.black : Colors.white;
    text4Color = isDarkMode ? Color(0xffe5e7eb) : Color(0xff9ca3af);
    text5Color = isDarkMode ? Color(0xff9ca3af) : Color(0xff4b5563);
    text6Color = isDarkMode ? Colors.white : Color(0xff1f2937);
    text7Color = isDarkMode ? Color(0xff262626) : Color(0xffe5e7eb);
    text8Color = isDarkMode
        ? Color.fromRGBO(100, 116, 139, 1)
        : Color.fromRGBO(148, 163, 184, .7);
    text9Color =
        isDarkMode ? Color(0xff9ca3af) : Colors.grey.shade500.withOpacity(0.9);
    text10Color = isDarkMode
        ? Color.fromRGBO(203, 213, 225, .75)
        : Color.fromRGBO(63, 63, 70, .8);
    indColor = isDarkMode ? Color(0xff9ca3af) : Colors.black;
    backgroundBox2Color = isDarkMode ? Colors.white : Colors.black;
    backgroundBox3Color = isDarkMode ? Color(0xff3f3f46) : Color(0xffdadde2);
    backgroundBox4Color =
        isDarkMode ? Color.fromRGBO(38, 38, 38, .8) : Colors.white;
    backgroundBox5Color = isDarkMode ? Colors.black : Color(0xfff8fafc);
    backgroundBox6Color = isDarkMode ? Color(0xff27272a) : Colors.white;
    backgroundIndColor =
        isDarkMode ? Color.fromRGBO(45, 45, 45, 1) : Color(0xff9ca3af);
    backgroundBoxColor =
        isDarkMode ? Color.fromRGBO(45, 45, 45, 1) : Color(0xffd8dbe0);
    imageBorderColor = isDarkMode
        ? Colors.grey.withOpacity(0.4)
        : Colors.grey.shade300.withOpacity(0.5);

    notifyListeners();
  }
}
