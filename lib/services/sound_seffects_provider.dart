import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundEffects extends ChangeNotifier {
  final AudioCache player = AudioCache();

  void playSound() {
    player.play('fileName');
  }
}
