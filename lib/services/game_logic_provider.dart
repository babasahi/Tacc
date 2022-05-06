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

  GameLogic({required this.boardUnitsValues, required this.freeBoardUnits});

  int getRandomPlay() {
    for (var i = 0; i < freeBoardUnits.length; i++) {
      if (!freeBoardUnits[i]) {
        return i;
      }
    }
    return -1;
  }

  bool stillPlaying() {
    bool still = true;
    if (checkState() == gameState.userWin) {
      still = false;
    } else if (checkState() == gameState.userLose) {
      still = false;
    } else if (checkState() == gameState.even) {
      still = false;
    }
    return still;
  }

  Future<void> computerPlay() async {
    boardUnitValue computerChoice;
    if (userChoice == boardUnitValue.o) {
      computerChoice = boardUnitValue.x;
    } else {
      computerChoice = boardUnitValue.o;
    }
    if (stillPlaying()) {
      int random = getRandomPlay();
      print('Computer playing .. ');
      isComputerThinking = true;
      // await Future.delayed(Duration(milliseconds: 400));
      freeBoardUnits[random] = true;
      boardUnitsValues[random] = computerChoice;
      computerMoves.add(random);
      checkState();
      notifyListeners();
      print('Computer played');
      print(boardUnitsValues);
      isComputerThinking = false;
    }
  }

  boardUnitValue getUserChoice() {
    return userChoice;
  }

  void resetBoard() {
    boardUnitsValues.clear();
    freeBoardUnits.clear();
    userMoves.clear();
    computerMoves.clear();
    notifyListeners();
  }

  void setUserChoice(boardUnitValue value) {
    userChoice = value;
    notifyListeners();
  }

  bool getIsComputerThinking() {
    return isComputerThinking;
  }

  gameState checkState() {
    gameState state;
    if (isWin()) {
      print(gameState.userWin);
      state = gameState.userWin;
    } else if (isLose()) {
      print(gameState.userLose);
      state = gameState.userLose;
    } else if (isEven()) {
      print(gameState.even);
      state = gameState.even;
    } else {
      print(gameState.playing);
      state = gameState.playing;
    }
    return state;
  }

  bool isWin() {
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
      print('User Won !');
      return true;
    } else {
      return false;
    }
  }

  bool isLose() {
    if (computerMoves.contains(0) &&
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
      print(gameState.userLose);

      return true;
    } else {
      return false;
    }
  }

  bool isEven() {
    if (boardUnitsValues.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  void userPlay(int index) {
    if (stillPlaying()) {
      if (!isComputerThinking) {
        if (!freeBoardUnits[index]) {
          freeBoardUnits[index] = true;
          boardUnitsValues[index] = userChoice;
          userMoves.add(index);
          print('User played .. ');
          print(userMoves);
          checkState();
          notifyListeners();
          computerPlay();
        }
      }
    }
  }
}
