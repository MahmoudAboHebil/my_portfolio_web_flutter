import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors extends ChangeNotifier {
  bool isDarkState = false;
  Color backgroundColor = Color(0xfff5f5f4);
  Color text1Color = Color(0xff485563);
  Color largeTextColor = Colors.black;
  Color iconColor = Colors.black;
  Color imageBorderColor = Colors.grey.shade300.withOpacity(0.5);
  void setColorMode(bool isDarkMode) {
    isDarkState = isDarkMode;
    backgroundColor = isDarkMode ? Color(0xff171717) : Color(0xfff5f5f4);
    text1Color = isDarkMode ? Color(0xff9ca3af) : Color(0xff485563);
    largeTextColor = isDarkMode ? Color(0xfff8fafc) : Colors.black;
    iconColor = isDarkMode ? Color(0xfff8fafc) : Colors.black;
    imageBorderColor = isDarkMode
        ? Colors.grey.withOpacity(0.4)
        : Colors.grey.shade300.withOpacity(0.5);

    notifyListeners();
  }
}
