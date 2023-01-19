import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/models.dart';

class GameBoard extends ChangeNotifier {
  final List<int> _gameBoard = List.filled(9, 0);

  List<int> get gameBoard => _gameBoard;

  void set(int index, int value) {
    _gameBoard[index] = value;
    notifyListeners();
  }

  int get(int index) {
    return _gameBoard[index];
  }

  GameState getGameState() {
    if (hasPlayerWon(1)) {
      return GameState.userWin;
    } else if (hasPlayerWon(2)) {
      return GameState.userLose;
    } else if (isBoardFull()) {
      return GameState.even;
    } else {
      return GameState.playing;
    }
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      _gameBoard[i] = 0;
    }
    notifyListeners();
  }

  bool isGameOver() {
    return isBoardFull() || hasPlayerWon(1) || hasPlayerWon(2);
  }

  bool isBoardFull() {
    for (int i = 0; i < 9; i++) {
      if (_gameBoard[i] == 0) {
        return false;
      }
    }
    return true;
  }

  bool hasPlayerWon(int player) {
    return (_gameBoard[0] == player &&
            _gameBoard[1] == player &&
            _gameBoard[2] == player) ||
        (_gameBoard[3] == player &&
            _gameBoard[4] == player &&
            _gameBoard[5] == player) ||
        (_gameBoard[6] == player &&
            _gameBoard[7] == player &&
            _gameBoard[8] == player) ||
        (_gameBoard[0] == player &&
            _gameBoard[3] == player &&
            _gameBoard[6] == player) ||
        (_gameBoard[1] == player &&
            _gameBoard[4] == player &&
            _gameBoard[7] == player) ||
        (_gameBoard[2] == player &&
            _gameBoard[5] == player &&
            _gameBoard[8] == player) ||
        (_gameBoard[0] == player &&
            _gameBoard[4] == player &&
            _gameBoard[8] == player) ||
        (_gameBoard[2] == player &&
            _gameBoard[4] == player &&
            _gameBoard[6] == player);
  }

  int evaluate() {
    if (hasPlayerWon(1)) {
      return 10;
    } else if (hasPlayerWon(2)) {
      return -10;
    } else {
      return 0;
    }
  }
}


// class GameLogic extends ChangeNotifier {
//   GameState _gameState = GameState.playing;
//   GameBoard _gameBoard = GameBoard();
//   bool _isX = true;
//   MinimaxAlgorithm _minimaxAlgorithm = MinimaxAlgorithm();

//   GameState get gameState => _gameState;
//   List<int> board() {
//     return _gameBoard.gameBoard;
//   }

//   bool hasAlreadyPlayed() {
//     return _gameBoard.gameBoard.contains(1) || _gameBoard.gameBoard.contains(2);
//   }
  
//   void setIsX(bool isX) {
//     _isX = isX;
//   }

//   bool get isX => _isX;
//   void userPlay(int index) {
//     _gameBoard.set(index, 1);
//   }
// }
