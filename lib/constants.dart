import 'package:flutter/material.dart';

// Logic
String playerChoice = '';
String computerChoice = '';
String start = 'Start Playing';
String won = 'You Won 💪 ';
String playing = 'Playing ⏳';
String lost = 'You Lost 😪 ';
String draw = 'Draw 😎';

// COLORS :
const Color kPrimaryColor = Color(0xFFFFFC00);
Color? kUnSelectedColor = Colors.yellow[200];
Color? kSelectedColor = Colors.yellow;
const Color kSecondaryColor = Color(0xFF6C12EE);
const Color kBackgroundColor = Colors.white;

// TEXTSTYLES
const TextStyle kBigChoice = TextStyle(
  fontSize: 42,
  fontFamily: 'TitilliumWeb',
  fontWeight: FontWeight.bold,
);
const TextStyle kChoiceStyle = TextStyle(
  fontSize: 38,
  fontFamily: 'TitilliumWeb',
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);
const TextStyle kAppTitleStyle = TextStyle(
  fontFamily: 'Ubuntu',
  color: Colors.black,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
const TextStyle kMainTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 58,
  fontWeight: FontWeight.bold,
  fontFamily: 'Nunito',
);
