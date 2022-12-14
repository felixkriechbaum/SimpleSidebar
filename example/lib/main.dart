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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SimpleSidebar(
          simpleSidebarTheme: SimpleSidebarTheme(),
          initialState: false,
          startIndexWithOne: true,
          sidebarItems: [
            SimpleSidebarItem(title: "Home", iconFront: Icons.home_outlined),
            SimpleSidebarItem(
                title: "Gallery", iconFront: Icons.image_outlined),
            SimpleSidebarItem(title: "Users", iconFront: Icons.group_outlined),
            SimpleSidebarItem(title: "Exit", iconEnd: Icons.close),
          ],
          onTapped: (value) {
            log("Switch to Item with value $value");
          },
          toggleSidebar: (value) {
            log("Sidebar is now $value");
          },
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.all(8),
          ),
        )
      ],
    ));
  }
}
