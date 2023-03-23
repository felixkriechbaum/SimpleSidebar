import 'package:flutter/material.dart';
import 'package:simple_sidebar/interface/simple_sidebar_element.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme.dart';

class SimpleSidebar extends StatefulWidget {
  /// the speed of the expand and collapse animation
  final Duration duration;

  final SimpleSidebarTheme theme;

  final List<SimpleSidebarItem> sidebarItems;

  final List<SimpleSidebarItem> footerItems;

  int index = 0;

  bool expanded = false;

  SimpleSidebar(
      {this.duration = const Duration(milliseconds: 1),
      this.theme = const SimpleSidebarTheme(),
      this.sidebarItems = const [],
      this.footerItems = const [],
      Key? key})
      : super(key: key);

  @override
  State<SimpleSidebar> createState() => _SimpleSidebarState();
}

class _SimpleSidebarState extends State<SimpleSidebar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      width: 100,
      color: widget.expanded
          ? widget.theme.collapsedBackgroundColor
          : widget.theme.expandedBackgroundColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.sidebarItems.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: widget.theme.distanceBetweenElements);
                },
                itemBuilder: (context, index) {
                  SimpleSidebarItem it = widget.sidebarItems[index];
                  return widget.expanded
                      ? ListTile(
                          leading: it.leading,
                          title: Text(it.title),
                        )
                      : TextButton(
                          child: it.leading!.runtimeType == Icon
                              ? Icon((it.leading! as Icon).icon,
                                  color: Colors.black)
                              : it.leading!,
                          onPressed: () {},
                        );
                },
              ),
            ),
            const Spacer(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.footerItems.length,
              itemBuilder: (context, index) {
                return ListTile();
              },
            ),
          ]),
    );
  }
}
