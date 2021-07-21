import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamers_hub/components/common/filled_outline_btn.dart';
import 'package:gamers_hub/models/game_base.dart';

import 'game_card.dart';

class GameChooserScreen extends StatefulWidget {
  GameChooserScreen({Key? key}) : super(key: key);

  @override
  _GameChooserScreenState createState() => _GameChooserScreenState();
}

class _GameChooserScreenState extends State<GameChooserScreen>
    with TickerProviderStateMixin {
  List<GameBase>? selected_list = [];
  final List<GameBase> item_list = game_base_list;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Center(
        child: Column(children: [
          Expanded(
            child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                // Generate 100 widgets that display their index in the List.
                children: item_list
                    .map((item) => GameCard(
                          gameBase: item,
                        ))
                    .toList()),
          ),
          Container(
              child: Row(
            children: [
              GameSearchBar(),
              ElevatedButton(onPressed: () {}, child: Text("Next"))
            ],
          ))
        ]),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
        bottom: TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          text: "PC".toUpperCase(),
        ),
        Tab(
          text: "PS4".toUpperCase(),
        ),
        Tab(
          text: "Mobile".toUpperCase(),
        ),
      ],
    ));
  }
}

class GameSearchBar extends StatelessWidget {
  const GameSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black38.withAlpha(50),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Game",
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {},
            ),
          ),
          Icon(
            Icons.search,
          )
        ],
      ),
    ));
  }
}
