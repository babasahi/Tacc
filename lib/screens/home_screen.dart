import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/screens/board_screen.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Provider<GameLogic>(
          create: (context) => GameLogic(boardUnitsValues: [
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty,
            boardUnitValue.empty
          ], freeBoardUnits: [
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
          ]),
          builder: (context, child) => SafeArea(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GameBoardPage()));
                },
                child: Container(
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text('Play Now !'),
                ),
              ),
            ),
          ),
        ));
  }
}
