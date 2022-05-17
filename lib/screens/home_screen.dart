import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/board_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.jpg')),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GameBoardPage()));
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(1),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                'Play Now',
                style: TextStyle(
                    color: Colors.blueAccent.shade700,
                    fontSize: 32,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
