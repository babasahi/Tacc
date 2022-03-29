import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';
import 'package:tic_tac_toe/constants.dart';

String status = playing;

class TheBoard extends StatefulWidget {
  TheBoard();

  @override
  _TheBoardState createState() => _TheBoardState();
}

class _TheBoardState extends State<TheBoard> {
  List<String> values = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  String checkGame() {
    if (checkGamePlayer(computerChoice) == true) {
      status = lost;
    } else if (checkGamePlayer(playerChoice) == true) {
      status = won;
    } else if (checkendGame() == true) {
      status = draw;
    } else if (checkStartGame() == true) {
      status = start;
    } else {
      status = playing;
    }
    return status;
  }

  bool checkStartGame() {
    bool result = false;
    if (values[0] == '' &&
        values[1] == '' &&
        values[2] == '' &&
        values[3] == '' &&
        values[4] == '' &&
        values[5] == '' &&
        values[6] == '' &&
        values[7] == '' &&
        values[8] == '') {
      result = true;
    }
    return result;
  }

  bool checkendGame() {
    bool result = false;
    if (values[0] != '' &&
        values[1] != '' &&
        values[2] != '' &&
        values[3] != '' &&
        values[4] != '' &&
        values[5] != '' &&
        values[6] != '' &&
        values[7] != '' &&
        values[8] != '') {
      result = true;
    }

    return result;
  }

  bool checkGamePlayer(String choice) {
    bool result = false;
    if (values[0] == choice && values[1] == choice && values[2] == choice) {
      result = true;
    } else if (values[3] == choice &&
        values[4] == choice &&
        values[5] == choice) {
      result = true;
    } else if (values[6] == choice &&
        values[7] == choice &&
        values[8] == choice) {
      result = true;
    } else if (values[0] == choice &&
        values[3] == choice &&
        values[6] == choice) {
      result = true;
    } else if (values[1] == choice &&
        values[4] == choice &&
        values[7] == choice) {
      result = true;
    } else if (values[2] == choice &&
        values[5] == choice &&
        values[8] == choice) {
      result = true;
    } else if (values[0] == choice &&
        values[4] == choice &&
        values[8] == choice) {
      result = true;
    } else if (values[2] == choice &&
        values[4] == choice &&
        values[6] == choice) {
      result = true;
    }

    return result;
  }

  Random random = Random();

  void updateState(int index) {
    if (values[index] == '') {
      values[index] = playerChoice;

      if (checkGame() == playing) {
        Future.delayed(Duration(milliseconds: 1050), () {
          for (int x = 0; x < values.length; x++) {
            if (values[x] == '') {
              values[x] = computerChoice;
              return null;
            }
          }
        });
      }
    }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(0);
                    });
                  },
                  child: BoardUi(values[0]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(1);
                    });
                  },
                  child: BoardUi(values[1]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(2);
                    });
                  },
                  child: BoardUi(values[2]),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(3);
                    });
                  },
                  child: BoardUi(values[3]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(4);
                    });
                  },
                  child: BoardUi(values[4]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(5);
                    });
                  },
                  child: BoardUi(values[5]),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(6);
                    });
                  },
                  child: BoardUi(values[6]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(7);
                    });
                  },
                  child: BoardUi(values[7]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateState(8);
                    });
                  },
                  child: BoardUi(values[8]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
