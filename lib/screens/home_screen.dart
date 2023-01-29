import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/board_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameBoardPage()));
              },
              child: Center(
                child: Card(
                    elevation: 4,
                    color: kPrimaryColor,
                    shadowColor: kPrimaryColor.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Play Now',
                        style: TextStyle(
                          fontSize: 38,
                          fontFamily: 'TitilliumWeb',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )),
              )),
        ));
  }
}
