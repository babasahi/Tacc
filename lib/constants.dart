import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/business_logic.dart';

// Logic
String playerChoice = '';
String computerChoice = '';
String won = 'You Won 💪 ';
String playing = 'Playing ⏳';
String lost = 'You Lost 😪 ';
String draw = 'Draw 😎';
String status = playing;
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

// COLORS :
const Color primaryColor = Color(0xFFFFFC00);
Color? unSelectedColor = Colors.yellow[200];
Color? selectedColor = Colors.yellow;
Color? xColor = unSelectedColor;
Color? oColor = unSelectedColor;

const Color c = Color(0xFF6C12EE);
const Color secondaryColor = Colors.white;
const Color bordersColor = Colors.white;

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
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
const TextStyle kMainTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 58,
  fontWeight: FontWeight.bold,
  fontFamily: 'Nunito',
);
