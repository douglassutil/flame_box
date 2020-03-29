import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame_box/components/fly.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {

  Size screenSize;
  double tileSize;
  bool hasWon = false;

  void render(Canvas canvas) {

    // Desenha o backgroud
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // Desenha a mosca
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Fly(this, screenCenterX, screenCenterY);

  }

  void update(double t) {
    // TODO: implement update
  }

  void onTapDown(TapDownDetails d) {
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

}
