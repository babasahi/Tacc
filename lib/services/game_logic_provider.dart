import 'package:flutter/foundation.dart';

enum gameState {
  userWin,
  userLose,
  even,
  playing,
}

enum boardUnitValue { x, o, empty }

class GameLogic extends ChangeNotifier {
  List<bool> freeBoardUnits = [];
  boardUnitValue userChoice = boardUnitValue.o;
  bool isComputerThinking = false;
  List<boardUnitValue> boardUnitsValues = [];
  List<int> userMoves = [];
  List<int> computerMoves = [];

  gameState _state = gameState.playing;
  GameLogic({required this.boardUnitsValues, required this.freeBoardUnits});

  int getRandomPlay() {
    for (var i = 0; i < freeBoardUnits.length; i++) {
      if (!freeBoardUnits[i]) {
        return i;
      }
    }
    return -1;
  }

  Future<void> computerPlay() async {
    boardUnitValue computerChoice;
    if (userChoice == boardUnitValue.o) {
      computerChoice = boardUnitValue.x;
    } else {
      computerChoice = boardUnitValue.o;
    }
    int random = getRandomPlay();
    print('Computer playing .. ');
    isComputerThinking = true;
    // await Future.delayed(Duration(milliseconds: 400));
    freeBoardUnits[random] = true;
    boardUnitsValues[random] = computerChoice;

    notifyListeners();
    print('Computer played');
    print(boardUnitsValues);
    isComputerThinking = false;
  }

  gameState getGameState() {
    checkState();
    return _state;
  }

  boardUnitValue getUserChoice() {
    return userChoice;
  }

  void setUserChoice(boardUnitValue value) {
    userChoice = value;
    notifyListeners();
  }

  bool getIsComputerThinking() {
    return isComputerThinking;
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
    if (!isComputerThinking) {
      if (!freeBoardUnits[index]) {
        freeBoardUnits[index] = true;
        boardUnitsValues[index] = userChoice;
        print('User played .. ');
        print(userMoves);

        notifyListeners();
        computerPlay();
      }
    }
  }
}
