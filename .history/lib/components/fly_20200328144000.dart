import 'dart:ui';
import 'package:flame_box/boxgame.dart';


class Fly {
  
  final BoxGame game;
  Rect flyRect;
  Paint flyPaint;

  Fly(this.game, double x, double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {}

  void update(double t) {}

}