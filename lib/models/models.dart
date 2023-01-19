class GameStatus {
  final GameState status;
  final List<int> gameBoard;

  GameStatus({required this.status, required this.gameBoard});
}

enum GameState {
  userWin,
  userLose,
  even,
  playing,
}
