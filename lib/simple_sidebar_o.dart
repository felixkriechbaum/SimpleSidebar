library simple_sidebar;

import 'package:flutter/material.dart';
import 'package:simple_sidebar/interface/simple_sidebar_element.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme.dart';

class SimpleSidebaro extends StatefulWidget {
  /// onTapped Callback
  final ValueChanged<int> onTapped;

  /// toggleSidebar Callback
  final ValueChanged<bool> toggleSidebar;

  /// The items of the sidebar
  final List<SimpleSidebarElement> sidebarItems;

  /// The footer items of the sidebar
  final List<SimpleSidebarElement>? sidebarFooterItems;

  /// The title image (like app icon)
  final Widget? titleImage;

  /// The title text (like app name)
  final String? titleText;

  /// The title sub text (like version number)
  final String? titleSubText;

  /// The text to show when the sidebar is expanded
  final String? expandedString;

  /// The text to show when the sidebar is collapsed
  final String? collapsedString;

  /// The initial expanded state of the sidebar (default: false)
  final bool? initialExpanded;

  /// The theme of the sidebar
  SimpleSidebarTheme? simpleSidebarTheme = SimpleSidebarTheme();

  /// Creates a new [SimpleSidebar]
  SimpleSidebaro(
      {Key? key,
      required this.sidebarItems,
      required this.onTapped,
      required this.toggleSidebar,
      this.sidebarFooterItems,
      this.simpleSidebarTheme,
      this.titleImage,
      this.titleText,
      this.titleSubText,
      this.collapsedString,
      this.expandedString,
      this.initialExpanded})
      : super(key: key);

  @override
  State<SimpleSidebaro> createState() => _SimpleSidebarStateo();
}

class _SimpleSidebarStateo extends State<SimpleSidebaro> {
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
          ? widget.simpleSidebarTheme?.expandedWidth ?? 190
          : widget.simpleSidebarTheme?.collapsedWidth ?? 73,
      decoration: BoxDecoration(
          color: isExpanded
              ? widget.simpleSidebarTheme?.expandedBackgroundColor
              : widget.simpleSidebarTheme?.collapsedBackgroundColor,
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
                      ? SizedBox(
                          width: 54, height: 54, child: widget.titleImage)
                      : const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        width: isExpanded
                            ? widget.titleImage == null
                                ? 162
                                : 110
                            : 0,
                        child: widget.titleText != null
                            ? Text(
                                widget.titleText.toString(),
                                style:
                                    widget.simpleSidebarTheme?.titleTextTheme,
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
                  height: widget.simpleSidebarTheme?.distanceBetweenElements,
                ),
                shrinkWrap: true,
                itemCount: widget.sidebarItems.length,
                itemBuilder: (BuildContext context, int index) {
                  SimpleSidebarElement element = widget.sidebarItems[index];
                  return listTileElement(element as SimpleSidebarItem, index);
                },
              ),
              const Spacer(),
              if (widget.sidebarFooterItems != null &&
                  widget.sidebarFooterItems!.isNotEmpty)
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: widget.simpleSidebarTheme?.distanceBetweenElements,
                  ),
                  shrinkWrap: true,
                  itemCount: widget.sidebarFooterItems!.length,
                  itemBuilder: (BuildContext context, int index) {
                    SimpleSidebarElement element =
                        widget.sidebarFooterItems![index];
                    return listTileElement(element as SimpleSidebarItem, index);
                  },
                ),
              Tooltip(
                message: isExpanded
                    ? widget.collapsedString ?? "Collapse"
                    : widget.expandedString ?? "Expand",
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    leading: isExpanded
                        ? Icon(Icons.arrow_back,
                            color:
                                widget.simpleSidebarTheme?.selectedIconColor ??
                                    Colors.white)
                        : Icon(Icons.arrow_forward,
                            color:
                                widget.simpleSidebarTheme?.selectedIconColor ??
                                    Colors.white),
                    title: Text(
                      widget.collapsedString ?? "Collapse",
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: widget.simpleSidebarTheme?.collapseExpandTextStyle,
                    ),
                    onTap: () => toggleExpanded(),
                    hoverColor: widget.simpleSidebarTheme?.hoverColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget like method for the SidebarItems
  Widget listTileElement(SimpleSidebarItem item, int index) {
    bool isSelected = selectedValue == index;
    return Tooltip(
      message: item.title,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: isSelected
              ? widget.simpleSidebarTheme?.selectedBackgroundColor
              : widget.simpleSidebarTheme?.unselectedBackgroundColor,
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          leading: item.leading,
          trailing: item.trailing,
          title: Text(
            item.title,
            style: isSelected
                ? widget.simpleSidebarTheme?.selectedTextStyle
                : widget.simpleSidebarTheme?.unselectedTextStyle,
            overflow: item.textOverflow ?? TextOverflow.fade,
            softWrap: item.wrapWord ?? false,),
          onTap: () {
            widget.onTapped(index);
            setState(() {
              selectedValue = index;
            });
          },
          hoverColor: widget.simpleSidebarTheme?.hoverColor,
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
