import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GameSounds extends ChangeNotifier {
  final AudioCache player = AudioCache();

  void win() {
    player.play('sounds/win.wav');
  }

  void buttonClick() {
    player.play('sounds/click.wav');
  }
}
