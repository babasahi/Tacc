import 'package:tic_tac_toe/constants.dart';

class Logic {
  void updateStatus() {
    checkGame();
  }

  String checkGame() {
    String stat = playing;
    if (checkGamePlayer(computerChoice) == true) {
      stat = lost;
    } else if (checkGamePlayer(playerChoice) == true) {
      stat = won;
    } else if (checkendGame() == true) {
      stat = draw;
    } else {
      stat = playing;
    }
    return stat;
  }

  bool checkendGame() {
    bool result = false;
    if (values[0] != '' &&
        values[1] != '' &&
        values[2] != '' &&
        values[3] != '' &&
        values[4] != '' &&
        values[5] != '' &&
        values[6] != '' &&
        values[7] != '' &&
        values[8] != '') {
      result = true;
    }

    return result;
  }

  bool checkGamePlayer(String choice) {
    bool result = false;
    if (values[0] == choice && values[1] == choice && values[2] == choice) {
      result = true;
    } else if (values[3] == choice &&
        values[4] == choice &&
        values[5] == choice) {
      result = true;
    } else if (values[6] == choice &&
        values[7] == choice &&
        values[8] == choice) {
      result = true;
    } else if (values[0] == choice &&
        values[3] == choice &&
        values[6] == choice) {
      result = true;
    } else if (values[1] == choice &&
        values[4] == choice &&
        values[7] == choice) {
      result = true;
    } else if (values[2] == choice &&
        values[5] == choice &&
        values[8] == choice) {
      result = true;
    } else if (values[0] == choice &&
        values[4] == choice &&
        values[8] == choice) {
      result = true;
    } else if (values[2] == choice &&
        values[4] == choice &&
        values[6] == choice) {
      result = true;
    }

    return result;
  }
}
