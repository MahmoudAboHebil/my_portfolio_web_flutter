import 'package:flutter/material.dart';
import '../../models/side_appbar_model.dart';

class SideAppBar extends StatefulWidget {
  const SideAppBar({super.key});

  @override
  State<SideAppBar> createState() => _SideAppBarState();
}

class _SideAppBarState extends State<SideAppBar> {
  int selectedIndex = 0;
  int hoverIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Color(0xfff8fafc),
      child: Column(
        children: List.generate(
          sideAppBarList.length,
          (index) => buildMenuItem(index),
        ),
      ),
    );
  }

  Widget buildMenuItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      onHover: (value) {
        setState(() {
          if (value && selectedIndex != index) {
            hoverIndex = index;
          } else {
            hoverIndex = selectedIndex;
          }
        });
      },
      child: AnimatedContainer(
        height: 50,
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.fromLTRB(
            selectedIndex == index || hoverIndex == index ? 20 : 0, 10, 0, 10),
        child: Row(
          children: [
            Icon(
              sideAppBarList[index].icon,
              color: selectedIndex == index ? Colors.black : Color(0xff64646a),
              size: 18,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              sideAppBarList[index].label,
              style: TextStyle(
                color:
                    selectedIndex == index ? Colors.black : Color(0xff64646a),
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
