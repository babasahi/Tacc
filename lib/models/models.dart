import 'package:tic_tac_toe/services/game_logic_provider.dart';

class GameStatus {
  final GameState status;
  final List<int> gameBoard;

  GameStatus({required this.status, required this.gameBoard});
}

class GameBoard {
  final List<int> _gameBoard = List.filled(9, 0);

  List<int> get gameBoard => _gameBoard;

  void set(int index, int value) {
    _gameBoard[index] = value;
  }

  int get(int index) {
    return _gameBoard[index];
  }

  void reset() {
    for (int i = 0; i < 9; i++) {
      _gameBoard[i] = 0;
    }
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
