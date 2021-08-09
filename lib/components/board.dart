import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/business_logic.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';
import 'package:tic_tac_toe/constants.dart';

class TheBoard extends StatefulWidget {
  TheBoard();

  @override
  _TheBoardState createState() => _TheBoardState();
}

String status = playing;

Computer computer = Computer();
Logic logic = Logic();
String checkGame() {
  if (logic.checkGamePlayer(computerChoice, values) == true) {
    status = lost;
  } else if (logic.checkGamePlayer(playerChoice, values) == true) {
    status = won;
  } else if (logic.checkendGame(values) == true) {
    status = draw;
  } else if (logic.checkStartGame(values) == true) {
    status = start;
  } else {
    status = playing;
  }
  return status;
}

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[0] == '') {
                        values[0] = playerChoice;
                        empty.remove(0);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
                    });
                  },
                  child: BoardUi(values[0]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[1] == '') {
                        values[1] = playerChoice;
                        empty.remove(1);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
                    });
                  },
                  child: BoardUi(values[1]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[2] == '') {
                        values[2] = playerChoice;
                        empty.remove(2);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
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
                      if (values[3] == '') {
                        values[3] = playerChoice;
                        empty.remove(3);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
                    });
                  },
                  child: BoardUi(values[3]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[4] == '') {
                        values[4] = playerChoice;
                        empty.remove(4);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
                    });
                  },
                  child: BoardUi(values[4]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[5] == '') {
                        values[5] = playerChoice;
                        empty.remove(5);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
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
                      if (values[6] == '') {
                        values[6] = playerChoice;
                        empty.remove(6);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
                    });
                  },
                  child: BoardUi(values[6]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[7] == '') {
                        values[7] = playerChoice;
                        empty.remove(7);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
                    });
                  },
                  child: BoardUi(values[7]),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (values[8] == '') {
                        values[8] = playerChoice;
                        empty.remove(8);
                        if (checkGame() == playing) {
                          values[computer.playMove()] = computerChoice;
                        }
                      }
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
