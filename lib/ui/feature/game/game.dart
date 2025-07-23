import 'package:candy_game/domain/game_controller.dart';
import 'package:candy_game/ui/feature/game/falling_game_widget.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class CandyGame extends FlameGame {
  late GameController _gameController;
  late Sprite figureSprite;

  @override
  Future<void> onLoad() async {
    print('CandyGame - Game size: $size');

    _gameController = GameController();

    try {
      figureSprite = await loadSprite('pieces/piece_a.png');
      print('CandyGame - Figure sprite loaded successfully');
    } catch (e) {
      print('CandyGame - Error loading figure sprite: $e');
    }
  }

  GameController get gameController => _gameController;

  void spawnFigure() {
    final figure = FallingFigure(
      sprite: figureSprite,
      size: Vector2(64, 64),
    );
    add(figure);
  }
}
