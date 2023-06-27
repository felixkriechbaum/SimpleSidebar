// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar_controller.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme_data.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SimpleSidebar extends StatefulWidget {
  SimpleSidebarController? controller;
  SimpleSidebarThemeData? theme;
  final List<SimpleSidebarItem> childrens;
  final List<SimpleSidebarItem>? footerItems;
  bool disableToggleButton;
  int initialIndex;
  bool initialExpanded;
  Function(int)? onTap;

  SimpleSidebar({
    Key? key,
    this.controller,
    this.onTap,
    this.theme,
    this.initialIndex = 0,
    required this.childrens,
    this.footerItems,
    this.disableToggleButton = false,
    this.initialExpanded = false,
  }) : super(key: key) {
    theme ??= SimpleSidebarThemeData();
    controller ??= SimpleSidebarController();
    if (initialExpanded) controller!.open!();
  }

  @override
  State<SimpleSidebar> createState() => _SimpleSidebarState();
}

class _SimpleSidebarState extends State<SimpleSidebar> with SingleTickerProviderStateMixin {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.theme!.transitionDuration,
      width: widget.controller!.isExpanded ? widget.theme!.expandedWidth : widget.theme!.collapsedWidth! + (widget.theme!.margin!.horizontal * 1),
      padding: widget.theme!.padding!,
      margin: widget.theme!.margin!,
      decoration: BoxDecoration(
        color: widget.theme!.collapsedBackgroundColor,
        borderRadius: widget.theme!.collapsedShape,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Body
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.childrens.length,
                    itemBuilder: (context, index) {
                      SimpleSidebarItem item = widget.childrens[index];
                      return ListTile(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          widget.childrens[index].onTap!();
                          widget.onTap!(index);
                        },
                        selected: selectedIndex == index,
                        leading: item.leading.runtimeType == IconData
                            ? Icon(item.leading!, color: widget.theme!.unselectedIconColor!)
                                .animate(target: selectedIndex == index ? 1 : 0)
                                .tint(duration: widget.theme!.transitionDuration, color: widget.theme!.selectedIconColor!)
                            : item.leadingWidget,
                        title: AnimatedDefaultTextStyle(
                          style: selectedIndex == index ? widget.theme!.selectedTextStyle! : widget.theme!.unselectedTextStyle!,
                          duration: widget.theme!.transitionDuration,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          child: Text(item.title),
                        ),
                      );
                    },
                  ),
                ),
                // Footer
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.footerItems!.length,
                  itemBuilder: (context, index) {
                    SimpleSidebarItem item = widget.footerItems![index];
                    return ListTile(
                      onTap: () {
                        setState(() {
                          selectedIndex = widget.childrens.length + index;
                          log(selectedIndex.toString());
                        });
                        widget.footerItems![index].onTap!();
                        widget.onTap!(widget.footerItems!.length + index);
                      },
                      selected: selectedIndex == widget.childrens.length + index,
                      leading: item.leading.runtimeType == IconData
                          ? Icon(item.leading!, color: widget.theme!.unselectedIconColor!)
                              .animate(target: selectedIndex == widget.childrens.length + index ? 1 : 0)
                              .tint(duration: widget.theme!.transitionDuration, color: widget.theme!.selectedIconColor!)
                          : item.leadingWidget,
                      title: AnimatedDefaultTextStyle(
                        style:
                            selectedIndex == widget.childrens.length + index ? widget.theme!.selectedTextStyle! : widget.theme!.unselectedTextStyle!,
                        duration: widget.theme!.transitionDuration,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        child: Text(item.title),
                      ),
                    );
                  },
                ),
                // Togglebutton
                if (widget.disableToggleButton == false)
                  ListTile(
                    onTap: () => setState(() {
                      widget.controller!.toggle!();
                    }),
                    leading: AnimatedRotation(
                      duration: widget.theme!.transitionDuration,
                      turns: widget.controller!.isExpanded ? 0.5 : 1,
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                    title: const Text(
                      "Collapse",
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
