import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_box/box-game.dart';

class StartButton {
  final BoxGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height * .75) - (game.tileSize * 1.5),
      game.tileSize * 6,
      game.tileSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {}

  void update(double t) {}

  void onTapDown() {}
}
