import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GameSounds extends ChangeNotifier {
  final AudioCache player = AudioCache();

  void win() {
    player.play('assets/sounds/win.wav');
  }

  void buttonClick() {
    player.play('assets/sounds/click.wav');
  }
}
