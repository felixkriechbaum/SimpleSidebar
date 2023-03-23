import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar_element.dart';

class SimpleSidebarItem extends SimpleSidebarElement {
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

  /// The widget that will be displayed in the end of the title
  final Widget? trailing;

  /// The icon that will be displayed in the front of the title
  final IconData? leadingIcon;

  /// The icon that will be displayed in the end of the title
  final IconData? trailingIcon;

  /// Creates a new [SimpleSidebarItem]
  SimpleSidebarItem({
    required this.title,
    this.wrapWord,
    this.textOverflow,
    this.customTooltipMessage,
    this.leading,
    this.trailing,
    this.leadingIcon,
    this.trailingIcon,
  }) {
    assert(!(trailing != null && trailingIcon != null),
        "You can't use both trailing and trailingIcon");
    assert(!(leading != null && leadingIcon != null),
        "You can't use both leading and leadingIcon");
  }
}
