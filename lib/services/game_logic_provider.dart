import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe/models/models.dart';
import 'package:tic_tac_toe/services/minimax_algorithm.dart';

enum GameState {
  userWin,
  userLose,
  even,
  playing,
}

enum BoardUnitValue { x, o, empty }

class GameLogic extends ChangeNotifier {
  MinimaxAlgorithm _minimaxAlgorithm = MinimaxAlgorithm();
  GameBoard _gameBoard = GameBoard();

  void startNewGame() {
    _gameBoard.reset();
    notifyListeners();
  }
  List<int> get gameBoard => _gameBoard.gameBoard;
  bool isGameOver() => _gameBoard.isGameOver();
  void 
}
