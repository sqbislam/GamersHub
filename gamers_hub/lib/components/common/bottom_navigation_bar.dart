import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required int selectedIndex, required Function(int) onItemTap})
      : _selectedIndex = selectedIndex,
        _onItemTap = onItemTap,
        super(key: key);

  final int _selectedIndex;
  final Function(int) _onItemTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      type: BottomNavigationBarType.shifting,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.circle_sharp),
            label: "global",
            backgroundColor: Colors.black12),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: "starred",
            backgroundColor: Colors.black12),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "chat",
            backgroundColor: Colors.black12),
        BottomNavigationBarItem(
            icon: Icon(Icons.article_sharp),
            label: "News",
            backgroundColor: Colors.black12),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.black12),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.white70,
      onTap: _onItemTap,
    );
  }
}
