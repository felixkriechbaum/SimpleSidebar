import 'package:flutter/material.dart';

class SimpleSidebarThemeData {
  // The Color of the Leading Selected Icon
  Color? selectedIconColor;

// The Color of the Leading Unselected Icon
  Color? unselectedIconColor;

  // The TextStyle of the Selected Item
  TextStyle? selectedTextStyle;

  // The TextStyle of the Unselected Item
  TextStyle? unselectedTextStyle;

  // The Background Color of the Expanded Sidebar
  Color? expandedBackgroundColor;

  // The Background Color of the Collapsed Sidebar
  Color? collapsedBackgroundColor;

  // The Shape of the Expanded Sidebar
  BorderRadius? expandedShape;

  // The Shape of the Collapsed Sidebar
  BorderRadius? collapsedShape;

  // The Elevation of the Sidebar
  double? elevation;

  // The Size of the Leading Icon
  double? iconSize;

  // The Width of the Expanded Sidebar
  double? expandedWidth;

  // The Width of the Collapsed Sidebar
  double? collapsedWidth;

  // The Padding of the Sidebar
  EdgeInsetsGeometry? padding;

  // The Margin of the Sidebar
  EdgeInsetsGeometry? margin;

  // The Duration of the Transition
  Duration transitionDuration;

  // Constructor of the Theme
  SimpleSidebarThemeData({
    this.selectedIconColor = Colors.white,
    this.unselectedIconColor = Colors.grey,
    this.selectedTextStyle = const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
    this.unselectedTextStyle = const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
    this.expandedBackgroundColor = Colors.blueGrey,
    this.collapsedBackgroundColor = Colors.blueGrey,
    this.expandedShape = const BorderRadius.all(Radius.circular(8)),
    this.collapsedShape = const BorderRadius.all(Radius.circular(8)),
    this.elevation = 5,
    this.iconSize = 24,
    this.expandedWidth = 400,
    this.collapsedWidth = 50,
    this.padding = const EdgeInsets.all(4),
    this.margin = const EdgeInsets.all(8),
    this.transitionDuration = const Duration(milliseconds: 300),
  });
}
