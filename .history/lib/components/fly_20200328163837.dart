import 'dart:ui';
import 'package:flame_box/boxgame.dart';


class Fly {
  
  final BoxGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;

  Fly(this.game, double x, double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    }
  }

  void onTapDown() {
    flyPaint.color = Color(0xffff4757);
    isDead = true;
  }

}