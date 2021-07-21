import 'package:flutter/material.dart';
import 'package:gamers_hub/models/game_base.dart';

class GameCard extends StatelessWidget {
  const GameCard({Key? key, required GameBase this.gameBase}) : super(key: key);
  final GameBase gameBase;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        gameBase.image.banner,
        fit: BoxFit.cover,
      ),
    );
  }
}
