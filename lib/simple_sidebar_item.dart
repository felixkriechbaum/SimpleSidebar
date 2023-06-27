import 'package:flutter/material.dart';

class SimpleSidebarItem {
  // required title for the sidebar item
  final String title;
  // leading icon for the sidebar item
  IconData? leading;
  // leading widget for the sidebar item
  Widget? leadingWidget;
  // onTap function for the sidebar item
  Function? onTap;

  // SimpleSidebarItem constructor
  SimpleSidebarItem({
    required this.title,
    this.leading,
    this.leadingWidget,
    this.onTap,
  });
}
