Simple and quick to set up sidebar. Soft animations

## Features

[Comming soon]

## Getting started

Just add the package to pubspec.yaml and start using it.

## Usage

```dart
Row(
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
    )
```

## Additional information

Should there be any questions, wishes mail me: [Contect](mailto:support@glocknerstudios.at)

create an issue on GitHub for bugs.
And now have fun with the sidebar