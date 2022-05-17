import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/components/board.dart';
import 'package:tic_tac_toe/components/common.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';
import 'package:tic_tac_toe/screens/who_are_we_screen.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';

class GameBoardPage extends StatefulWidget {
  @override
  _GameBoardPageState createState() => _GameBoardPageState();
}

class _GameBoardPageState extends State<GameBoardPage> {
  Widget showModal() {
    Provider.of<GameLogic>(context, listen: false).getShowAlert()
        ? showMaterialModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Text('end'),
              );
            })
        : print('');
    return SizedBox(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ReturnIcon(destination: HomePage()),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Tacc', style: kAppTitleStyle),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WhoAreWe()));
                });
              },
              child: Icon(Icons.info, size: 30, color: Colors.black),
            ),
          )
        ],
      ),
      body: ChangeNotifierProvider<GameLogic>(
          create: (context) => GameLogic(boardUnitsValues: [
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty,
                BoardUnitValue.empty
              ], freeBoardUnits: [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
              ]),
          builder: (context, child) => SafeArea(
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PlayerPicker(),
                      ScorWidget(),
                      TheBoard(),
                      PlayAgain(),
                    ],
                  ),
                ),
              )),
    );
  }
}

class PlayAgain extends StatefulWidget {
  const PlayAgain({Key? key}) : super(key: key);

  @override
  State<PlayAgain> createState() => _PlayAgainState();
}

class _PlayAgainState extends State<PlayAgain> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<GameLogic>(context, listen: false).getShowAlert()
        ? GestureDetector(
            onTap: () {
              Provider.of<GameLogic>(context, listen: false).restartGame();
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding: EdgeInsets.all(8),
              child: Text(
                'Play again !',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          )
        : SizedBox();
  }
}
