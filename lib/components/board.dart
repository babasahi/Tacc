import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';

class TheBoard extends StatefulWidget {
  TheBoard();

  @override
  _TheBoardState createState() => _TheBoardState();
}

class _TheBoardState extends State<TheBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                BoardUnitWidget(index: 0),
                BoardUnitWidget(index: 1),
                BoardUnitWidget(index: 2),
              ],
            ),
            Row(
              children: [
                BoardUnitWidget(index: 3),
                BoardUnitWidget(index: 4),
                BoardUnitWidget(index: 5),
              ],
            ),
            Row(
              children: [
                BoardUnitWidget(index: 6),
                BoardUnitWidget(index: 7),
                BoardUnitWidget(index: 8),
              ],
            ),
          ],
        ));
  }
}
