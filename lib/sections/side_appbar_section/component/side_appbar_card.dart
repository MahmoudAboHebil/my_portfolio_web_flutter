import 'package:flutter/material.dart';
import 'package:portfolio_2/models/side_appbar_model.dart';

// List<bool> list = List.generate(sideAppBarList.length, (index) => false);

class SideAppBarCard extends StatefulWidget {
  final int index;
  SideAppBarCard(this.index);
  @override
  State<SideAppBarCard> createState() => _SideAppBarCardState();
}

class _SideAppBarCardState extends State<SideAppBarCard> {
  int selectedIndex = 0;
  int hoverIndex = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = widget.index;
        });
      },
      onHover: (value) {
        setState(() {
          value ? hoverIndex = widget.index : hoverIndex = selectedIndex;
        });
      },
      child: AnimatedContainer(
        height: 50,
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.fromLTRB(
            selectedIndex == widget.index ? 20 : 0, 10, 0, 10),
        child: Row(
          children: [
            Icon(
              sideAppBarList[widget.index].icon,
              color: Color(0xff64646a),
              size: 18,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              sideAppBarList[widget.index].label,
              style: TextStyle(
                color: selectedIndex == widget.index
                    ? Colors.black
                    : Color(0xff64646a),
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
