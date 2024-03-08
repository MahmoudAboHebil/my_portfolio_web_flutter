import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_colors/app_colors.dart';
import '../../routing/navigtion_service.dart';
import 'component/side_appbar_bottom_content.dart';
import 'component/side_appbar_center_content.dart';
import 'component/side_appbar_top_content.dart';

class SideAppBar extends StatefulWidget {
  int selectedIndex;

  SideAppBar(this.selectedIndex, {super.key});

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
            color: Provider.of<AppColors>(context).backgroundBox5Color,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SideAppBarTopContent(),
                    SizedBox(
                      height: 50,
                    ),
                    StreamBuilder<int>(
                      stream: streamController.stream,
                      builder: (context, snapshot) {
                        return SideAppBarCenterContent(
                            snapshot.hasData
                                ? snapshot.data!
                                : getCurrentWidget(),
                            snapshot.hasData
                                ? snapshot.data!
                                : getCurrentWidget());
                      },
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SideAppBarBottomContent(),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
