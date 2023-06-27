Simple and quick to set up sidebar. Soft animations

![Image from the Package](https://mediahub.glocknerstudios.at/sidebar/SimpleSidebar002.png)

## Features

<video width="1280" height="720" controls>
  <source src="https://mediahub.glocknerstudios.at/sidebar/presentation.mp4" type="video/mp4">
</video>



## Getting started

Just add the package to pubspec.yaml and start using it.

## Usage

Create Theme & Controller and List of the Item you want to have in the Sidebar
```dart
final SimpleSidebarTheme theme = SimpleSidebarTheme()
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
```

After this create the Scaffold with the lists
```dart
Scaffold(
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
```

## Additional information

Should there be any questions, wishes mail me: [Contact](mailto:support@glocknerstudios.at)

create an issue on GitHub for bugs.
And now have fun with the sidebar