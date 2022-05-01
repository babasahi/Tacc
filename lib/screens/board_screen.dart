import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/components/board.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/who_are_we_screen.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';

class GameBoardPage extends StatefulWidget {
  @override
  _GameBoardPageState createState() => _GameBoardPageState();
}

class _GameBoardPageState extends State<GameBoardPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Provider<GameLogic>(
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
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            'Tic Tac Toe ',
            style: kAppTitleStyle,
          ),
          centerTitle: true,
          actions: [
            Container(
              padding: EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WhoAreWe(),
                      ),
                    );
                  });
                },
                child: Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PlayerPicker(),
                ScorWidget(),
                TheBoard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
