import 'package:flutter/material.dart';

const List<Tab> _tabs = <Tab>[
  Tab(
    icon: Icon(Icons.circle_sharp),
  ),
  Tab(
    icon: Icon(Icons.star_border_outlined),
  ),
  Tab(
    icon: Icon(Icons.chat_bubble_outline),
  ),
  Tab(
    icon: Icon(Icons.article_sharp),
  ),
  Tab(
    icon: Icon(Icons.person),
  ),
];

const List<IconData> _icons = <IconData>[
  Icons.circle_sharp,
  Icons.star_border_outlined,
  Icons.chat_bubble_outline,
  Icons.article_sharp,
  Icons.person
];

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required int selectedIndex, required TabController controller})
      : _controller = controller,
        super(key: key);
  final TabController _controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: Colors.white24,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.transparent,
      labelColor: Theme.of(context).accentColor,
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 18),
      controller: _controller,
      tabs: _tabs,
    );
  }
}
