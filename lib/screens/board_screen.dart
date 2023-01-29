import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/components/board.dart';
import 'package:tic_tac_toe/components/common.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';
import 'package:tic_tac_toe/screens/who_are_we_screen.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';
import 'package:tic_tac_toe/services/sound_seffects_provider.dart';

class GameBoardPage extends StatefulWidget {
  @override
  _GameBoardPageState createState() => _GameBoardPageState();
}

class _GameBoardPageState extends State<GameBoardPage> {
  Widget showModal() {
    Provider.of<GameBoard>(context, listen: false).showAlert
        ? showBottomSheet(
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
    return SizedBox(height: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: ReturnIcon(destination: HomePage()),
          elevation: 1,
          backgroundColor: Theme.of(context).colorScheme.background,
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
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<GameBoard>(
              create: (context) => GameBoard(),
            ),
            ChangeNotifierProvider(
              create: (context) => GameSounds(),
            )
          ],
          builder: (context, child) => SafeArea(
            child: Container(
              color: Theme.of(context).colorScheme.background,
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
          ),
        ));
  }
}
