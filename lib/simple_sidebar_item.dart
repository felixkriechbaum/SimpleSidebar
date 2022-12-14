import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar_element.dart';

class SimpleSidebarItem extends SimpleSidebarElement {
  final String title;
  final Widget child;
  final String? customTooltipMessage;
  final IconData? iconFront;
  final IconData? iconEnd;

  SimpleSidebarItem(
      {required this.title,
      required this.child,
      this.customTooltipMessage,
      this.iconFront,
      this.iconEnd}) {
    assert(iconEnd != null || iconFront != null,
        "You need to provide at least one icon");
  }
}
