import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_sidebar/simple_sidebar.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme.dart';

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
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: kDebugMode,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<SimpleSidebarItem> sidebarItems = [
    SimpleSidebarItem(
        title: "Home",
        iconFront: Icons.home_outlined,
        child: const Center(child: Text("Home"))),
    SimpleSidebarItem(
        title: "Gallery",
        iconFront: Icons.image_outlined,
        child: const Center(child: Text("Gallery"))),
    SimpleSidebarItem(
        title: "Users",
        iconFront: Icons.group_outlined,
        child: const Center(child: Text("Users"))),
    SimpleSidebarItem(
        title: "Extra long name for a menu item",
        wrapWord: true,
        iconFront: Icons.group_outlined,
        child: const Center(child: Text("Users"))),
    SimpleSidebarItem(
        title: "Exit",
        iconEnd: Icons.close,
        child: const Center(child: Text("Exit"))),
  ];
  final String title;

  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Row(
          children: [
            SimpleSidebar(
              simpleSidebarTheme: SimpleSidebarTheme(),
              initialExpanded: false,
              sidebarItems: widget.sidebarItems,
              onTapped: (value) => onTapped(value),
              toggleSidebar: (value) {
                log("Sidebar is now $value");
              },
            ),
            Expanded(
              child: AnimatedOpacity(
                opacity: isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    margin: const EdgeInsets.all(8),
                    child: widget.sidebarItems.elementAt(selected).child),
              ),
            )
          ],
        ));
  }

  void onTapped(int value) {
    setState(() {
      isVisible = false;
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        selected = value;
      });
    }).then((value) {
      setState(() {
        isVisible = true;
      });
    });
  }
}
