import 'package:tic_tac_toe/models/models.dart';

class MinimaxAlgorithm {
  int counter = 0;
  int minimax(
      GameState gameState, List<int> gameBoard, int depth, bool isMaximizing) {
    print("minimax called");
    print("depth: $depth");

    if (gameState == GameState.userWin) {
      return 10;
    } else if (gameState == GameState.userLose) {
      return -10;
    } else if (gameState == GameState.even) {
      return 0;
    } else if (depth == 0) {
      return 0;
    }

    if (isMaximizing) {
      int bestScore = -100000;
      for (int i = 0; i < 9; i++) {
        if (gameBoard[i] == 0) {
          gameBoard[i] = 2;
          int score = minimax(gameState, gameBoard, depth + 1, false);
          gameBoard[i] = 0;
          bestScore = score > bestScore ? score : bestScore;
        }
      }
      return bestScore;
    } else {
      int bestScore = 100000;
      for (int i = 0; i < 9; i++) {
        if (gameBoard[i] == 0) {
          gameBoard[i] = 1;
          int score = minimax(gameState, gameBoard, depth + 1, true);
          gameBoard[i] = 0;
          bestScore = score < bestScore ? score : bestScore;
        }
      }
      return bestScore;
    }
  }

  int findBestMove(List<int> gameBoard, GameState gameState) {
    int bestScore = -100000;
    int bestMove = -1;
    for (int i = 0; i < 9; i++) {
      if (gameBoard[i] == 0) {
        gameBoard[i] = 2;
        int score = minimax(gameState, gameBoard, 9, false);
        gameBoard[i] = 0;
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }
}
