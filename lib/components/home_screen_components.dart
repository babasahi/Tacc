import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class PlayerPicker extends StatefulWidget {
  @override
  _PlayerPickerState createState() => _PlayerPickerState();
}

class _PlayerPickerState extends State<PlayerPicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.all(6),
            width: 68,
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
                    'Me : ',
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
                        if (xColor == selectedColor) {
                          xColor = unSelectedColor;
                        } else if (xColor == unSelectedColor) {
                          playerChoice = 'X';
                          xColor = selectedColor;
                          oColor = unSelectedColor;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          topLeft: Radius.circular(14),
                        ),
                        color: xColor,
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
                        if (oColor == selectedColor) {
                          oColor = unSelectedColor;
                        } else if (oColor == unSelectedColor) {
                          playerChoice = 'O';
                          oColor = selectedColor;
                          xColor = unSelectedColor;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                        color: oColor,
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

class GamePanel extends StatefulWidget {
  GamePanel(this.values);
  final List<String> values;
  @override
  _GamePanelState createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          color: Colors.deepPurpleAccent[400],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoardUnit(0),
                BoardUnit(1),
                BoardUnit(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoardUnit(3),
                BoardUnit(4),
                BoardUnit(5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoardUnit(6),
                BoardUnit(7),
                BoardUnit(8),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BoardUnit extends StatefulWidget {
  BoardUnit(this.value);
  final int value;

  @override
  _BoardUnitState createState() => _BoardUnitState();
}

class _BoardUnitState extends State<BoardUnit> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            values[widget.value] = playerChoice;
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
              values[widget.value],
              style: kMainTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
