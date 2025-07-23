import 'package:flame/components.dart';
import 'package:flame/effects.dart';

class FallingFigure extends SpriteComponent {
  FallingFigure({required super.sprite, super.size});

  @override
  void onMount() {
    super.onMount();
    position = Vector2(size.x / 2, -size.y);

    add(
      MoveEffect.to(
        Vector2(size.x / 2, size.y / 2),
        EffectController(duration: 2.0),
      ),
    );
  }
}
