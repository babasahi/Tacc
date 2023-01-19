import 'package:tic_tac_toe/models/models.dart';
import 'package:tic_tac_toe/services/game_logic_provider.dart';

class MinimaxAlgorithm {
  int minimax(GameBoard gameBoard, int depth, bool isMaximizing) {
    if (gameBoard.gameState == GameState.userWin) {
      return 10;
    } else if (gameBoard.gameState == GameState.userLose) {
      return -10;
    } else if (gameBoard.gameState == GameState.even) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (gameBoard.gameBoard[i] == 0) {
          gameBoard.gameBoard[i] = 2;
          int score = minimax(gameBoard, depth + 1, false);
          gameBoard.gameBoard[i] = 0;
          bestScore = score > bestScore ? score : bestScore;
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (gameBoard.gameBoard[i] == 0) {
          gameBoard.gameBoard[i] = 1;
          int score = minimax(gameBoard, depth + 1, true);
          gameBoard.gameBoard[i] = 0;
          bestScore = score < bestScore ? score : bestScore;
        }
      }
      return bestScore;
    }
  }

  int findBestMove(GameBoard gameBoard) {
    int bestScore = -1000;
    int bestMove = -1;
    for (int i = 0; i < 9; i++) {
      if (gameBoard.gameBoard[i] == 0) {
        gameBoard.gameBoard[i] = 2;
        int score = minimax(gameBoard, 0, false);
        gameBoard.gameBoard[i] = 0;
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }
}
