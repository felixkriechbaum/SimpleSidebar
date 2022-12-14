import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar_element.dart';

class SimpleSidebarItem extends SimpleSidebarElement {
  final String title;
  final String? customTooltipMessage;
  final IconData? iconFront;
  final IconData? iconEnd;

  SimpleSidebarItem(
      {required this.title,
      this.customTooltipMessage,
      this.iconFront,
      this.iconEnd}) {
    assert(iconEnd != null || iconFront != null,
        "You need to provide at least one icon");
  }
}
