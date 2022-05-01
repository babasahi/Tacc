import 'package:flutter/material.dart';

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
