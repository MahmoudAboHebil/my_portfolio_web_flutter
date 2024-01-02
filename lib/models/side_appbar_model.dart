import 'package:flutter/material.dart';

class SideAppBarModel {
  final IconData icon;
  final String label;

  SideAppBarModel(this.icon, this.label);
}

List<SideAppBarModel> sideAppBarList = [
  SideAppBarModel(Icons.home, "Home"),
  SideAppBarModel(Icons.person, "About"),
  SideAppBarModel(Icons.assured_workload_sharp, "Service"),
  SideAppBarModel(Icons.work, "Portfolio"),
  SideAppBarModel(Icons.local_post_office_rounded, "Contact"),
];
