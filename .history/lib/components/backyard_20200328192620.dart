import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_box/boxgame.dart';

class Backyard {

  final BoxGame game;
  Sprite bgSprite;
  Rect bgRect;
  
  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {}

  void update(double t) {}

}