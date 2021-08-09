import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/business_logic.dart';
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
                        if (xColor == selectedColor) {
                          xColor = unSelectedColor;
                        } else if (xColor == unSelectedColor) {
                          playerChoice = 'X';
                          computerChoice = 'O';
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
                          computerChoice = 'X';
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

class ScorWidget extends StatefulWidget {
  @override
  _ScorWidgetState createState() => _ScorWidgetState();
}

class _ScorWidgetState extends State<ScorWidget> {
  Logic logic = Logic();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        start,
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

class BoardUi extends StatefulWidget {
  BoardUi(this.text);
  final String text;

  @override
  _BoardUiState createState() => _BoardUiState();
}

class _BoardUiState extends State<BoardUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          widget.text,
          style: kMainTextStyle,
        ),
      ),
    );
  }
}
