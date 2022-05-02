import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';

class TheBoard extends StatefulWidget {
  TheBoard();

  @override
  _TheBoardState createState() => _TheBoardState();
}

class _TheBoardState extends State<TheBoard> {
  void refreshUi() {
    setState(() {});
  }

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
                BoardUnitWidget(index: 0, notifyParent: refreshUi),
                BoardUnitWidget(index: 1, notifyParent: refreshUi),
                BoardUnitWidget(index: 2, notifyParent: refreshUi),
              ],
            ),
            Row(
              children: [
                BoardUnitWidget(index: 3, notifyParent: refreshUi),
                BoardUnitWidget(index: 4, notifyParent: refreshUi),
                BoardUnitWidget(index: 5, notifyParent: refreshUi),
              ],
            ),
            Row(
              children: [
                BoardUnitWidget(index: 6, notifyParent: refreshUi),
                BoardUnitWidget(index: 7, notifyParent: refreshUi),
                BoardUnitWidget(index: 8, notifyParent: refreshUi),
              ],
            ),
          ],
        ));
  }
}
