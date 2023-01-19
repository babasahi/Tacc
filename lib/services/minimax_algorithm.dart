import 'package:tic_tac_toe/models/models.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';

class MinimaxAlgorithm {
  int minimax(GameStatus gameStatus, int depth, bool isMaximizing) {
    if (gameStatus.state == GameState.userWin) {
      return 10;
    } else if (gameStatus.state == GameState.userLose) {
      return -10;
    } else if (gameStatus.state == GameState.even) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (gameStatus.gameBoard[i] == 0) {
          gameStatus.gameBoard[i] = 2;
          int score = minimax(gameStatus, depth + 1, false);
          gameStatus.gameBoard[i] = 0;
          bestScore = score > bestScore ? score : bestScore;
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (gameStatus.gameBoard[i] == 0) {
          gameStatus.gameBoard[i] = 1;
          int score = minimax(gameStatus, depth + 1, true);
          gameStatus.gameBoard[i] = 0;
          bestScore = score < bestScore ? score : bestScore;
        }
      }
      return bestScore;
    }
  }

  int findBestMove(GameStatus gameStatus) {
    int bestScore = -1000;
    int bestMove = -1;
    for (int i = 0; i < 9; i++) {
      if (gameStatus.gameBoard[i] == 0) {
        gameStatus.gameBoard[i] = 2;
        int score = minimax(gameStatus, 0, false);
        gameStatus.gameBoard[i] = 0;
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }
}
