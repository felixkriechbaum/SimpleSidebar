import 'dart:developer';

import 'package:example/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplesidebar Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: kDebugMode,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final SimpleSidebarThemeData theme = SimpleSidebarThemeData()
    ..expandedShape = const BorderRadius.all(Radius.circular(8))
    ..collapsedShape = const BorderRadius.all(Radius.circular(8));
  final List<SimpleSidebarItem> sidebarItems = [
    SimpleSidebarItem(onTap: () {}, title: "Home", leading: Icons.home_outlined),
    SimpleSidebarItem(onTap: () {}, title: "Gallery", leading: Icons.image_outlined),
    SimpleSidebarItem(onTap: () {}, title: "Users", leading: Icons.group_outlined),
    SimpleSidebarItem(onTap: () {}, title: "Extra long name for a menu item", leading: Icons.list),
  ];
  final List<SimpleSidebarItem> footerItems = [
    SimpleSidebarItem(onTap: () {}, title: "Settings", leading: Icons.settings),
    SimpleSidebarItem(onTap: () {}, title: "Logout", leading: Icons.close),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
      body: Row(
        children: [
          SimpleSidebar(
            theme: widget.theme,
            initialExpanded: true,
            initialIndex: 1,
            childrens: widget.sidebarItems,
            footerItems: widget.footerItems,
            onTap: (value) {
              setState(() {
                selected = value;
              });
              log("selected value $value");
            },
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: isVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                  margin: const EdgeInsets.all(8),
                  child: const <Widget>[
                    Text("hallo"),
                    Text("hallo2"),
                    Text("hallo3"),
                    Text("hallo4"),
                    Text("hallo5"),
                    Text("hallo6"),
                  ][selected]),
            ),
          ),
        ],
      ),
    );
  }

  // void onTapped(int value) {
  //   setState(() {
  //     isVisible = false;
  //   });
  //   Future.delayed(const Duration(milliseconds: 400), () {
  //     setState(() {
  //       selected = value;
  //     });
  //   }).then((value) {
  //     setState(() {
  //       isVisible = true;
  //     });
  //   });
  // }
}
