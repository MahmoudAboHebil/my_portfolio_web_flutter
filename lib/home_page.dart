import 'package:flutter/material.dart';
import 'package:portfolio_2/layout/desktop_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio_2/services/navigtion_service.dart';

import 'components/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  Widget child;

  HomePage(this.child);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controllerScrollBar = ScrollController();

  final FocusNode _focusNode = FocusNode();
  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _controllerScrollBar.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _controllerScrollBar.animateTo(offset - 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        } else {
          _controllerScrollBar.animateTo(offset - 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _controllerScrollBar.animateTo(offset + 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        } else {
          _controllerScrollBar.animateTo(offset + 200,
              duration: Duration(milliseconds: 30), curve: Curves.ease);
        }
      });
    }
  }

  @override
  void dispose() {
    streamController.close();
    _focusNode.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: MyAppBar(),
      key: _key,
      drawer: size.width <= 1046 ? MyDrawer() : null,

      body: DesktopLayout(_key, widget.child),
    );
  }
}
