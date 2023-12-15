import 'package:flutter/material.dart';
import 'package:portfolio_2/services/navigtion_service.dart';
import 'component/side_appbar_bottom_content.dart';
import 'component/side_appbar_center_content.dart';
import 'component/side_appbar_top_content.dart';

class SideAppBar extends StatefulWidget {
  int selectedIndex;

  SideAppBar(this.selectedIndex);

  @override
  State<SideAppBar> createState() => _SideAppBarState();
}

class _SideAppBarState extends State<SideAppBar> {
  bool isPressedClose = false;

  callBackToClose() {
    setState(() {
      isPressedClose = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isPressedClose
        ? Container(
            width: 280,
            height: double.infinity,
            padding: EdgeInsets.all(10),
            color: Color(0xfff8fafc),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SideAppBarTopContent(
                    callBackToClose: callBackToClose,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  StreamBuilder<int>(
                    stream: streamController.stream,
                    builder: (context, snapshot) {
                      return SideAppBarCenterContent(
                          snapshot.hasData ? snapshot.data! : 0,
                          snapshot.hasData ? snapshot.data! : 0);
                    },
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  SideAppBarBottomContent(),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
