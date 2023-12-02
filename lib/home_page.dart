import 'package:flutter/material.dart';
import 'package:portfolio_2/layout/desktop_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(),
      // drawer: MyDrawer(),

      body: DesktopLayout(_controllerScrollBar, widget.child),
    );
  }
}
