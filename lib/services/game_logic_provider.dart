import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe/components/home_screen_components.dart';

enum gameState {
  userWin,
  userLose,
  even,
  playing,
}

class GameLogic extends ChangeNotifier {
  List<bool> freeBoardUnits = [];
  List<boardUnitValue> boardUnitsValues = [];
  List<int> userMoves = [];
  List<int> computerMoves = [];
  gameState _state = gameState.playing;
  GameLogic({required this.boardUnitsValues, required this.freeBoardUnits});
  void computerPlay() {
    for (var i = 0; i < freeBoardUnits.length; i++) {
      if (!freeBoardUnits[i]) {
        freeBoardUnits[i] = true;
        computerMoves.add(i);
      }
    }
    notifyListeners();
  }

  gameState getGameState() {
    checkState();
    return _state;
  }

  bool isGameBoardFull() {
    bool f = false;
    for (var i = 0; i < freeBoardUnits.length; i++) {
      if (!freeBoardUnits[i]) {
        f = true;
      }
    }
    return f;
  }

  void checkState() {
    if (userMoves.length < 3 && computerMoves.length < 3) {
      _state = gameState.playing;
    } else {
      if (userMoves.contains(0) &&
              userMoves.contains(1) &&
              userMoves.contains(2) ||
          userMoves.contains(3) &&
              userMoves.contains(4) &&
              userMoves.contains(5) ||
          userMoves.contains(6) &&
              userMoves.contains(7) &&
              userMoves.contains(8) ||
          userMoves.contains(0) &&
              userMoves.contains(3) &&
              userMoves.contains(6) ||
          userMoves.contains(1) &&
              userMoves.contains(4) &&
              userMoves.contains(7) ||
          userMoves.contains(2) &&
              userMoves.contains(5) &&
              userMoves.contains(8) ||
          userMoves.contains(2) &&
              userMoves.contains(4) &&
              userMoves.contains(6) ||
          userMoves.contains(0) &&
              userMoves.contains(4) &&
              userMoves.contains(8)) {
        _state = gameState.userWin;
      } else if (computerMoves.contains(0) &&
              computerMoves.contains(1) &&
              computerMoves.contains(2) ||
          computerMoves.contains(3) &&
              computerMoves.contains(4) &&
              computerMoves.contains(5) ||
          computerMoves.contains(6) &&
              computerMoves.contains(7) &&
              computerMoves.contains(8) ||
          computerMoves.contains(0) &&
              computerMoves.contains(3) &&
              computerMoves.contains(6) ||
          computerMoves.contains(1) &&
              computerMoves.contains(4) &&
              computerMoves.contains(7) ||
          computerMoves.contains(2) &&
              computerMoves.contains(5) &&
              computerMoves.contains(8) ||
          computerMoves.contains(2) &&
              computerMoves.contains(4) &&
              computerMoves.contains(6) ||
          computerMoves.contains(0) &&
              computerMoves.contains(4) &&
              computerMoves.contains(8)) {
        _state = gameState.userLose;
      } else if (isGameBoardFull()) {
        _state = gameState.even;
      }
    }
    notifyListeners();
  }

  void userPlay(int index) {
    freeBoardUnits[index] = true;
    userMoves.add(index);
    notifyListeners();
  }
}
