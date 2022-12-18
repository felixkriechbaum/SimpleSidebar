library simple_sidebar;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar_element.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme.dart';

class SimpleSidebar extends StatefulWidget {
  final ValueChanged<int> onTapped;
  final ValueChanged<bool> toggleSidebar;
  final List<SimpleSidebarElement> sidebarItems;
  final Widget? titleImage;
  final String? titleText;
  final String? titleSubText;
  final bool? initialExpanded;
  final SimpleSidebarTheme simpleSidebarTheme;

  const SimpleSidebar(
      {required this.sidebarItems,
      required this.onTapped,
      required this.simpleSidebarTheme,
      required this.toggleSidebar,
      this.titleImage,
      this.titleText,
      this.titleSubText,
      this.initialExpanded,
      super.key});

  @override
  State<SimpleSidebar> createState() => _SimpleSidebarState();
}

class _SimpleSidebarState extends State<SimpleSidebar> {
  bool isExpanded = false;
  int selectedValue = 0;

  @override
  void initState() {
    isExpanded = widget.initialExpanded ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: isExpanded
          ? widget.simpleSidebarTheme.expandedWidth ?? 190
          : widget.simpleSidebarTheme.collapsedWidth ?? 73,
      decoration: BoxDecoration(
          color: isExpanded
              ? widget.simpleSidebarTheme.expandedBackgroundColor
              : widget.simpleSidebarTheme.collapsedBackgroundColor,
          borderRadius: BorderRadius.circular(16)),
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.titleImage != null
                      ? Container(
                          width: 54,
                          height: 54,
                          color: Colors.red,
                          child: widget.titleImage)
                      : const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        width: isExpanded ? 110 : 0,
                        child: widget.titleText != null
                            ? Text(
                                widget.titleText.toString(),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )
                            : null,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        width: isExpanded ? 110 : 0,
                        child: widget.titleSubText != null
                            ? Text(
                                widget.titleSubText.toString(),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
              ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: widget.simpleSidebarTheme.distanceBetweenElements,
                ),
                shrinkWrap: true,
                itemCount: widget.sidebarItems.length,
                itemBuilder: (BuildContext context, int index) {
                  SimpleSidebarElement element = widget.sidebarItems[index];
                  return listTileElement(element as SimpleSidebarItem, index);
                },
              ),
              const Spacer(),
              Tooltip(
                message: isExpanded ? "Collapse" : "Expand",
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    leading: isExpanded
                        ? const Icon(Icons.arrow_back)
                        : const Icon(Icons.arrow_forward),
                    title: const Text("Collapse",
                        softWrap: false, overflow: TextOverflow.clip),
                    onTap: () => toggleExpanded(),
                    hoverColor: widget.simpleSidebarTheme.hoverColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTileElement(SimpleSidebarItem item, int index) {
    bool isSelected = selectedValue == index;
    return Tooltip(
      message: item.title,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: isSelected
              ? widget.simpleSidebarTheme.selectedBackgroundcolor
              : widget.simpleSidebarTheme.unselectedBackgroundcolor,
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          leading: Icon(item.iconFront,
              color: isSelected
                  ? widget.simpleSidebarTheme.selectedIconColor
                  : widget.simpleSidebarTheme.unselectedIconColor),
          trailing: Icon(item.iconEnd,
              color: isSelected
                  ? widget.simpleSidebarTheme.selectedIconColor
                  : widget.simpleSidebarTheme.unselectedIconColor),
          title: Text(
            item.title,
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
          onTap: () {
            log(index.toString());
            widget.onTapped(index);
            setState(() {
              selectedValue = index;
            });
          },
          hoverColor: widget.simpleSidebarTheme.hoverColor,
        ),
      ),
    );
  }

  toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      widget.toggleSidebar(isExpanded);
    });
  }
}
