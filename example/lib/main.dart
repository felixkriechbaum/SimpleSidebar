import 'dart:developer';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  bool isVisible = true;
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
        title: "Exit",
        iconEnd: Icons.close,
        child: const Center(child: Text("Exit"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SimpleSidebar(
          simpleSidebarTheme: SimpleSidebarTheme(),
          initialState: false,
          sidebarItems: sidebarItems,
          onTapped: (value) {
            log("Switch to Item with value $value");
            setState(() {
              selected = value;
            });
          },
          toggleSidebar: (value) {
            log("Sidebar is now $value");
          },
        ),
        Expanded(
          child: AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: Container(
                margin: const EdgeInsets.all(8),
                child: sidebarItems.elementAt(selected).child),
          ),
        )
      ],
    ));
  }
}
