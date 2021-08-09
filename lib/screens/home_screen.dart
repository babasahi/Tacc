import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/board.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/who_are_we_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Tic Tac Toe ',
          style: kAppTitleStyle,
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WhoAreWe(),
                    ),
                  );
                });
              },
              child: Icon(
                Icons.info,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerPicker(),
              ScorWidget(),
              TheBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
