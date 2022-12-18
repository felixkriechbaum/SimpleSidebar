import 'package:flutter/material.dart';

class SimpleSidebarTheme {
  Color expandedBackgroundColor = Colors.red;
  Color collapsedBackgroundColor = Colors.blue;
  Color selectedBackgroundcolor = Colors.blueGrey[300]!;
  Color unselectedBackgroundcolor = Colors.transparent;
  Color selectedIconColor = Colors.black;
  Color unselectedIconColor = Colors.grey;
  Color selectedTextColor = Colors.black;
  Color unselectedTextColor = Colors.grey;
  Color hoverColor;
  double? expandedWidth = 190;
  double? collapsedWidth = 73;
  double? distanceBetweenElements = 8;

  SimpleSidebarTheme(
      {this.expandedBackgroundColor = Colors.blueGrey,
      this.collapsedBackgroundColor = Colors.blueGrey,
      this.selectedBackgroundcolor = Colors.white60,
      this.unselectedBackgroundcolor = Colors.transparent,
      this.selectedIconColor = Colors.black,
      this.unselectedIconColor = Colors.black45,
      this.selectedTextColor = Colors.black,
      this.unselectedTextColor = Colors.black45,
      this.hoverColor = Colors.black12,
      this.expandedWidth,
      this.collapsedWidth,
      this.distanceBetweenElements});
}
