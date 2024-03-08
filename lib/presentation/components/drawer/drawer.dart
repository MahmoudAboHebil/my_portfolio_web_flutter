import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_colors/app_colors.dart';
import '../../routing/navigtion_service.dart';
import '../side_appbar/component/side_appbar_bottom_content.dart';
import '../side_appbar/component/side_appbar_center_content.dart';
import '../side_appbar/component/side_appbar_top_content.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Container(
        width: 250,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        color: Provider.of<AppColors>(context).backgroundBox5Color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: true),
                child: ListView(
                  primary: true,
                  shrinkWrap: true,
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
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SideAppBarBottomContent(),
            ),
          ],
        ),
      ),
    );
  }
}
