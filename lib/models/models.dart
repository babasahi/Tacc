import 'package:tic_tac_toe/services/game_logic_provider.dart';

class GameStatus {
  final GameState state;
  final List<int> gameBoard;

  GameStatus({required this.state, required this.gameBoard});
}
