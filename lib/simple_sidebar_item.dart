import 'package:flutter/material.dart';
import 'package:simple_sidebar/interface/simple_sidebar_element.dart';

class SimpleSidebarItem implements SimpleSidebarElement {
  /// The title of the item
  final String title;

  /// If the text should soft wrap or not
  final bool? wrapWord;

  /// The text overflow behavior
  final TextOverflow? textOverflow;

  /// The custom tooltip message (default the title)
  final String? customTooltipMessage;

  /// The widget that will be displayed in the front of the title
  final Widget? leading;

  /// The widget that will be displayed in the front of the title when selected
  final Widget? leadingSelected;

  /// The widget that will be displayed in the end of the title
  final Widget? trailing;

  /// The widget that will be displayed in the end of the title when selected
  final Widget? trailingSelected;

  final bool? footer;

  /// Creates a new [SimpleSidebarItem]
  SimpleSidebarItem({
    required this.title,
    this.wrapWord,
    this.textOverflow,
    this.customTooltipMessage,
    this.leading,
    this.trailing,
    this.leadingSelected,
    this.trailingSelected,
    this.footer,
  });
}
