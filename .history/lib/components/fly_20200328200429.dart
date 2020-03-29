import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame_box/box-game.dart';


class Fly {
  
  final BoxGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite; 
  Sprite deadSprite; 
  double flyingSpriteIndex = 0;

  Fly(this.game, double x, double y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {
    if (isDead) { 
      deadSprite.renderRect(c, flyRect.inflate(2)); 
    } else { 
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2)); 
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);

      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    }
  }

  void onTapDown() {
    if (!isDead) {
      isDead = true;
      game.spawnFly();
    }
  }

}