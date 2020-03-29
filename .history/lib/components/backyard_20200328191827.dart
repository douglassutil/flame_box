import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_box/boxgame.dart';

class Backyard {

  final BoxGame game;

  Sprite bgSprite;
  
  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
  }

  void render(Canvas c) {}

  void update(double t) {}
  
}
