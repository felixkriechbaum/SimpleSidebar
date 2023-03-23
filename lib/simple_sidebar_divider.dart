import 'package:flutter/material.dart';
import 'package:simple_sidebar/interface/simple_sidebar_element.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';

class SimpleSideBarDivider implements SimpleSidebarElement {

  final Color? color;
  final double? thickness;

  SimpleSideBarDivider({this.color = Colors.grey, this.thickness = 2});

}