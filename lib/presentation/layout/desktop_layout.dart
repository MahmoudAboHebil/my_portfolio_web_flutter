import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio_2/presentation/app_colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../components/button_color/button_color.dart';
import '../components/curved/curved_navigation_bar.dart';
import '../components/custom_appbar/custom_appbar.dart';
import '../components/side_appbar/side_appbar.dart';
import '../models/side_appbar_model.dart';
import '../routing/navigtion_service.dart';

class DesktopLayout extends StatefulWidget {
  final GlobalKey<ScaffoldState> _key;
  Widget child;
  DesktopLayout(this._key, this.child);
  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  ScrollController yourScrollController = ScrollController();
  int selectedIndex = 0;
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  int index = 0;

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   index = getCurrentWidget();
    //   if (Provider.of<AppColors>(context).isDarkState) {
    //     list = getIconsDark(index);
    //   } else {
    //     list = getIcons(index);
    //   }
    // });
    streamController.stream.listen((indexStream) {
      setState(() {
        index = getCurrentWidget();
      });
    });
  }

  List<IconData> iconsData = [
    Icons.home,
    Icons.person,
    Icons.assured_workload_sharp,
    Icons.work,
    Icons.local_post_office_rounded,
  ];
  List<Widget> getIcons(int index) {
    List<Widget> list = [];
    for (int i = 0; i < iconsData.length; i++) {
      if (i != index) {
        list.add(Icon(
          iconsData[i],
          color: Color.fromRGBO(63, 63, 70, .8),
          size: 22,
        ));
      } else {
        list.add(Icon(
          iconsData[i],
          size: 25,
        ));
      }
    }
    return list;
  }

  List<Widget> getIconsDark(int index) {
    List<Widget> list = [];
    for (int i = 0; i < iconsData.length; i++) {
      if (i != index) {
        list.add(Icon(
          iconsData[i],
          color: Color.fromRGBO(63, 63, 70, .8),
          size: 22,
        ));
      } else {
        print('object');
        list.add(Icon(
          iconsData[i],
          size: 25,
          color: Colors.white,
        ));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Provider.of<AppColors>(context).backgroundColor,
      alignment:
          size.width > 1046 ? Alignment.centerRight : Alignment.topCenter,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            alignment:
                size.width > 1046 ? Alignment.center : Alignment.centerRight,
            child: Column(
              children: [
                !(size.width > 1046)
                    ? CustomAppBar(
                        isWebMobile && (size.width <= 650) ? true : false,
                        widget._key)
                    : SizedBox(),
                Expanded(
                  child: AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: 485,
                    ),
                    duration: Duration(seconds: 1),
                    alignment: size.width > 1046
                        ? Alignment.centerRight
                        : Alignment.center,
                    margin: size.width > 1046
                        ? EdgeInsets.only(left: 280)
                        : EdgeInsets.only(left: 0),
                    child: (isWebMobile && (size.width <= 650))
                        ? Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              widget.child,
                              Provider.of<AppColors>(context).isDarkState
                                  ? CurvedNavigationBar(
                                      key: ValueKey('Dark'),
                                      height: 40,
                                      index: index,
                                      color: Provider.of<AppColors>(context)
                                          .backgroundBox5Color,
                                      buttonBackgroundColor:
                                          Provider.of<AppColors>(context)
                                              .buttonColor2,
                                      backgroundColor: Colors.transparent,
                                      items: getIconsDark(index),
                                      onTap: (index) {
                                        Get.rootDelegate.toNamed(
                                            '/${sideAppBarList[index].label}');
                                        //Handle button tap
                                      },
                                    )
                                  : CurvedNavigationBar(
                                      height: 40,
                                      index: index,
                                      color: Provider.of<AppColors>(context)
                                          .backgroundBox5Color,
                                      buttonBackgroundColor:
                                          Provider.of<AppColors>(context)
                                              .backgroundBox6Color,
                                      backgroundColor: Colors.transparent,
                                      items: getIcons(index),
                                      onTap: (index) {
                                        Get.rootDelegate.toNamed(
                                            '/${sideAppBarList[index].label}');
                                        //Handle button tap
                                      },
                                    )
                            ],
                          )
                        : widget.child,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          size.width > 1046
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SideAppBar(0),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ButtonColor(false),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
