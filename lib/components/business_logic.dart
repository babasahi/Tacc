import 'package:tic_tac_toe/constants.dart';

class Logic {
  bool checkStartGame(List<String> list) {
    bool result = false;
    if (list[0] == '' &&
        list[1] == '' &&
        list[2] == '' &&
        list[3] == '' &&
        list[4] == '' &&
        list[5] == '' &&
        list[6] == '' &&
        list[7] == '' &&
        list[8] == '') {
      result = true;
    }
    return result;
  }

  bool checkendGame(List<String> list) {
    bool result = false;
    if (list[0] != '' &&
        list[1] != '' &&
        list[2] != '' &&
        list[3] != '' &&
        list[4] != '' &&
        list[5] != '' &&
        list[6] != '' &&
        list[7] != '' &&
        list[8] != '') {
      result = true;
    }

    return result;
  }

  bool checkGamePlayer(String choice, List<String> list) {
    bool result = false;
    if (list[0] == choice && list[1] == choice && list[2] == choice) {
      result = true;
    } else if (list[3] == choice && list[4] == choice && list[5] == choice) {
      result = true;
    } else if (list[6] == choice && list[7] == choice && list[8] == choice) {
      result = true;
    } else if (list[0] == choice && list[3] == choice && list[6] == choice) {
      result = true;
    } else if (list[1] == choice && list[4] == choice && list[7] == choice) {
      result = true;
    } else if (list[2] == choice && list[5] == choice && list[8] == choice) {
      result = true;
    } else if (list[0] == choice && list[4] == choice && list[8] == choice) {
      result = true;
    } else if (list[2] == choice && list[4] == choice && list[6] == choice) {
      result = true;
    }

    return result;
  }
}

class Computer {
  int playMove() {
    int nextMove = empty.first;

    empty.remove(nextMove);

    return nextMove;
  }
}
