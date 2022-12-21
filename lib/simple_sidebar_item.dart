import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar_element.dart';

class SimpleSidebarItem extends SimpleSidebarElement {
  /// The title of the item
  final String title;

  /// The child that will be displayed when the item is selected
  final Widget child;

  /// If the text should soft wrap or not
  final bool? wrapWord;

  /// The text overflow behavior
  final TextOverflow? textOverflow;

  /// The custom tooltip message (default the title)
  final String? customTooltipMessage;

  /// The icon that will be displayed in the front of the title
  final IconData? iconFront;

  /// The icon that will be displayed in the end of the title
  final IconData? iconEnd;

  /// Creates a new [SimpleSidebarItem]
  SimpleSidebarItem(
      {required this.title,
      required this.child,
      this.wrapWord,
      this.textOverflow,
      this.customTooltipMessage,
      this.iconFront,
      this.iconEnd}) {
    assert(iconEnd != null || iconFront != null,
        "You need to provide at least one icon");
  }
}
