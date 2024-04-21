import 'package:flutter/material.dart';

class SlidingClippedNavBar extends StatelessWidget {
  const SlidingClippedNavBar({
    Key? key,
    required this.backgroundColor,
    required this.onButtonPressed,
    required this.iconSize,
    required this.activeColor,
    required this.selectedIndex,
    required this.barItems,
    // required this.isCircularAvatar,
  }) : super(key: key);

  final Color backgroundColor;
  final Function(int) onButtonPressed;
  final double iconSize;
  final Color activeColor;
  final int selectedIndex;
  final List<BarItem> barItems;
  // final bool isCircularAvatar;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: barItems
            .asMap()
            .entries
            .map(
              (entry) => IconButton(
                icon: Icon(
                  entry.value.icon,
                  size: iconSize,
                  color: selectedIndex == entry.key ? activeColor : null,
                ),
                onPressed: () => onButtonPressed(entry.key),
              ),
            )
            .toList(),
      ),
    );
  }
}

class BarItem {
  const BarItem({required this.icon, required this.title});

  final IconData icon;
  final String title;
}
