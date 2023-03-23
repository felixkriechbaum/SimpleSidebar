import 'dart:developer';

import 'package:flutter/material.dart';

@immutable
class SimpleSidebarTheme extends ThemeExtension<SimpleSidebarTheme> {
  /// The background color of the sidebar when it is expanded
  final Color expandedBackgroundColor;

  /// The background color of the sidebar when it is collapsed
  final Color collapsedBackgroundColor;

  /// The background color of the selected item
  final Color selectedBackgroundColor;

  /// The background color of the unselected item
  final Color unselectedBackgroundColor;

  /// The color of the selected icon
  final Color selectedIconColor;

  /// The color of the unselected icon
  final Color unselectedIconColor;

  /// The color of the text of the selected item
  final TextStyle? selectedTextStyle;

  /// The color of the text of the unselected item
  final TextStyle? unselectedTextStyle;

  /// The color of the sidebar when the mouse is hovering over it
  final Color hoverColor;

  /// The width of the sidebar when it is expanded
  final double? expandedWidth;

  /// The width of the sidebar when it is collapsed
  final double? collapsedWidth;

  /// The style of the collapse/expand text
  final TextStyle? collapseExpandTextStyle;

  /// The distance between the elements in the sidebar
  final double? distanceBetweenElements;

  /// The text style of the title
  final TextStyle? titleTextTheme;

  /// Creates a new [SimpleSidebarTheme]
  const SimpleSidebarTheme(
      {this.expandedBackgroundColor = Colors.blueGrey,
      this.collapsedBackgroundColor = Colors.blueGrey,
      this.selectedBackgroundColor = Colors.white60,
      this.unselectedBackgroundColor = Colors.transparent,
      this.selectedIconColor = Colors.black,
      this.unselectedIconColor = Colors.black45,
      this.selectedTextStyle,
      this.unselectedTextStyle,
      this.hoverColor = Colors.black12,
      this.expandedWidth = 100,
      this.collapsedWidth = 200,
      this.titleTextTheme = const TextStyle(fontSize: 24, color: Colors.white),
      this.collapseExpandTextStyle = const TextStyle(fontSize: 14, color: Colors.white),
      this.distanceBetweenElements});

  @override
  ThemeExtension<SimpleSidebarTheme> copyWith() {
    log("Not implemented yet, if needed create an github issue!");
    return this;
  }

  @override
  ThemeExtension<SimpleSidebarTheme> lerp(covariant ThemeExtension<SimpleSidebarTheme>? other, double t) {
    log("Not implemented yet, if needed create an github issue!");
    return other ?? this;
  }
}
