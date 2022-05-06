import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';

class PlayerPicker extends StatefulWidget {
  @override
  _PlayerPickerState createState() => _PlayerPickerState();
}

class _PlayerPickerState extends State<PlayerPicker> {
  bool isX = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.all(6),
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              color: Colors.deepPurpleAccent[400],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'You : ',
                    style: kChoiceStyle,
                  ),
                ),
                Center(
                  child: Text(
                    playerChoice,
                    style: kChoiceStyle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              color: Theme.of(context).primaryColor,
            ),
            height: 65,
            width: 240,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isX) {
                          isX = true;
                          Provider.of<GameLogic>(context, listen: false)
                              .setUserChoice(boardUnitValue.x);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          topLeft: Radius.circular(14),
                        ),
                        color: isX ? selectedColor : unSelectedColor,
                      ),
                      child: Center(
                        child: Text(
                          'X',
                          style: kBigChoice,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isX) {
                          isX = false;
                          Provider.of<GameLogic>(context, listen: false)
                              .setUserChoice(boardUnitValue.o);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                        color: isX ? unSelectedColor : selectedColor,
                      ),
                      child: Center(
                        child: Text(
                          'O',
                          style: kBigChoice,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScorWidget extends StatefulWidget {
  @override
  _ScorWidgetState createState() => _ScorWidgetState();
}

class _ScorWidgetState extends State<ScorWidget> {
  String getLabel() {
    if (Provider.of<GameLogic>(context, listen: false).getGameState() ==
        gameState.userWin) {
      return 'You Won !';
    } else if (Provider.of<GameLogic>(context, listen: false).getGameState() ==
        gameState.userLose) {
      return 'You Lost ';
    } else {
      return 'Playing ..';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        getLabel(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class BoardUnitWidget extends StatefulWidget {
  BoardUnitWidget({required this.index, required this.uniqueKey});
  final int index;
  final UniqueKey uniqueKey;
  @override
  _BoardUnitWidgetState createState() => _BoardUnitWidgetState();
}

class _BoardUnitWidgetState extends State<BoardUnitWidget> {
  String getLabel() {
    boardUnitValue value =
        Provider.of<GameLogic>(context).boardUnitsValues[widget.index];
    if (value == boardUnitValue.o) {
      return 'O';
    } else if (value == boardUnitValue.x) {
      return 'X';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Provider.of<GameLogic>(context, listen: false).userPlay(widget.index);
        });
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              )),
          margin: EdgeInsets.all(2),
          height: 120,
          width: 120,
          child: Center(
            child: Text(
              getLabel(),
              style: kMainTextStyle,
            ),
          )),
    );
  }
}
