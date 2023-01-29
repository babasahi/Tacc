import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/models.dart';

class GameBoard extends ChangeNotifier {
  List<int> _gameBoard = List.filled(9, 0);
  bool turn = true;
  bool _smartMode = false;
  bool _isX = true;
  GameState _gameState = GameState.playing;
  List<int> get gameBoard => _gameBoard;
  List<String> gameBoardString = ["", "", "", "", "", "", "", "", ""];
  GameState get gameState => _gameState;
  bool _showAlert = false;

  void toggleSmartMode() {
    _smartMode = !_smartMode;
    notifyListeners();
  }

  void _set(int index, int value) {
    _gameBoard[index] = value;
    gameBoardString[index] =
        value == 1 ? (_isX ? "X" : "O") : (_isX ? "O" : "X");
    _setGameState();
    _showAlert = _isGameOver();
    notifyListeners();
  }

  bool get smartMode => _smartMode;
  void setIsX(bool value) {
    _isX = value;
    notifyListeners();
  }

  void computerPlay() {
    List<int> temp = List.from(_gameBoard);
    int move = smartMode ? findBestMove(temp) : dumpAlgorithm(_gameBoard);
    _set(move, 2);
  }

  void userPlay(index) {
    _set(index, 1);
    turn = false;
    computerPlay();
    turn = true;
  }

  bool get showAlert => _showAlert;
  bool get isX => _isX;

  bool hasAlreadyPlayed() {
    return _gameBoard.contains(1) || gameBoard.contains(2);
  }

  void _setGameState() {
    if (hasPlayerWon(1)) {
      _gameState = GameState.userWin;
    } else if (hasPlayerWon(2)) {
      _gameState = GameState.userLose;
    } else if (isBoardFull()) {
      _gameState = GameState.even;
    } else {
      _gameState = GameState.playing;
    }
    notifyListeners();
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      _gameBoard[i] = 0;
    }
    notifyListeners();
  }

  bool _isGameOver() {
    return isBoardFull() || hasPlayerWon(1) || hasPlayerWon(2);
  }

  bool isBoardFull() {
    return !_gameBoard.contains(0);
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

  // dump algorithm
  int dumpAlgorithm(List<int> board) {
    List<int> freeMoves = [];
    board.forEach((element) {
      if (element == 0) freeMoves.add(element);
    });
    freeMoves.shuffle();
    return freeMoves.last;
  }

  // Minimax Algorithm
  int count = 0;
  int minimax(List<int> board, int depth, bool isMax) {
    print("Count: ${count++}");
    int score = evaluate();
    if (score == 10) {
      return score - depth;
    }
    if (score == -10) {
      return score + depth;
    }
    if (isBoardFull()) {
      return 0;
    }
    if (isMax) {
      int best = -1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == 0) {
          board[i] = 2;
          best = best > minimax(board, depth + 1, false)
              ? best
              : minimax(board, depth + 1, false);
        }
      }
      return best;
    } else {
      int best = 1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == 0) {
          board[i] = 1;
          best = best < minimax(board, depth + 1, true)
              ? best
              : minimax(board, depth + 1, true);
        }
      }
      return best;
    }
  }

  int findBestMove(List<int> board) {
    int bestVal = -1000;
    int bestMove = -1;
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        board[i] = 2;
        int moveVal = minimax(board, 0, false);
        board[i] = 0;
        if (moveVal > bestVal) {
          bestMove = i;
          bestVal = moveVal;
        }
      }
    }
    return bestMove;
  }
}
