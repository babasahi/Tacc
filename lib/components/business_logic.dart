import 'package:tic_tac_toe/constants.dart';

class Logic {
  String status = playing;
  void updateStatus() {
    checkGame();
  }

  String checkGame() {
    if (checkGamePlayer(computerChoice) == true) {
      status = lost;
    } else if (checkGamePlayer(playerChoice) == true) {
      status = won;
    } else if (checkendGame() == true) {
      status = draw;
    } else if (checkStartGame() == true) {
      status = start;
    } else {
      status = playing;
    }
    return status;
  }

  bool checkStartGame() {
    bool result = false;
    if (values[0] == '' &&
        values[1] == '' &&
        values[2] == '' &&
        values[3] == '' &&
        values[4] == '' &&
        values[5] == '' &&
        values[6] == '' &&
        values[7] == '' &&
        values[8] == '') {
      result = true;
    }
    return result;
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

class Computer {
  Logic logic = Logic();
  int playMove() {
    if (logic.checkGame() == playing) {
      empty.remove(getRandom());
    }
    return getRandom();
  }

  int getRandom() {
    int result;

    if (empty.isNotEmpty) {
      result = empty.first;
    } else {
      result = 10;
    }

    return result;
  }
}
