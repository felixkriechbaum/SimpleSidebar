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
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
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
      leading: const Icon(Icons.home_outlined),
    ),
    SimpleSidebarItem(
      title: "Gallery",
      leading: const Icon(Icons.image_outlined),
    ),
    SimpleSidebarItem(
      title: "Users",
      leading: const Icon(Icons.group_outlined),
    ),
    SimpleSidebarItem(
      title: "Extra long name for a menu item",
      wrapWord: true,
      leading: const Icon(Icons.group_outlined),
    ),
    SimpleSidebarItem(
      title: "Exit",
      trailing: const Icon(Icons.close),
    ),
  ];
  final List<SimpleSidebarItem> footerItems = [
    SimpleSidebarItem(
      title: "Logout",
      trailing: const Icon(Icons.close),
    ),
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
              simpleSidebarTheme: SimpleSidebarTheme(
                  titleTextTheme: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  selectedTextColor: Colors.white,
                  unselectedTextColor: Colors.grey,
                  selectedIconColor: Colors.white,
                  unselectedIconColor: Colors.grey),
              titleText: "Hello World",
              titleImage: const Icon(Icons.public),
              initialExpanded: false,
              sidebarItems: widget.sidebarItems,
              sidebarFooterItems: widget.footerItems,
              collapsedString: "Collapse Me :)",
              expandedString: "Expand Me :)",
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
                    child: const <Widget>[Text("hallo"), Text("hallo2")][0]),
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
