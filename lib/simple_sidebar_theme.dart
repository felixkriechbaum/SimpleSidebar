import 'package:flutter/material.dart';

class SimpleSidebarTheme {
  /// The background color of the sidebar when it is expanded
  Color expandedBackgroundColor = Colors.red;

  /// The background color of the sidebar when it is collapsed
  Color collapsedBackgroundColor = Colors.blue;

  /// The background color of the selected item
  Color selectedBackgroundcolor = Colors.blueGrey[300]!;

  /// The background color of the unselected item
  Color unselectedBackgroundcolor = Colors.transparent;

  /// The color of the selected icon
  Color selectedIconColor = Colors.black;

  /// The color of the unselected icon
  Color unselectedIconColor = Colors.grey;

  /// The color of the text of the selected item
  Color selectedTextColor = Colors.black;

  /// The color of the text of the unselected item
  Color unselectedTextColor = Colors.grey;

  /// The color of the sidebar when the mouse is hovering over it
  Color hoverColor;

  /// The width of the sidebar when it is expanded
  double? expandedWidth = 190;

  /// The width of the sidebar when it is collapsed
  double? collapsedWidth = 73;

  /// The distance between the elements in the sidebar
  double? distanceBetweenElements = 8;

  /// Creates a new [SimpleSidebarTheme]
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
