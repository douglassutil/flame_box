import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {

  Size screenSize;
  bool hasWon = false;

  void render(Canvas canvas) {

    // Desenha o backgroud
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // Desenha o player
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    double width = 150;
    double height = 150;
    Rect boxRect = Rect.fromLTWH(screenCenterX - (width/2), screenCenterY - (height/2), width, height);
    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);

  }

  void update(double t) {
    // TODO: implement update
  }

  void onTapDown(TapDownDetails d) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75
      && d.globalPosition.dx <= screenCenterX + 75
      && d.globalPosition.dy >= screenCenterY - 75
      && d.globalPosition.dy <= screenCenterY + 75
    ) {
      hasWon = true;
    }
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

}
