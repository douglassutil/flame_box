import 'dart:ui';
import 'package:flame/game.dart';

class BoxGame extends Game {

  Size screenSize;

  void render(Canvas canvas) {

    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(screenCenterX - 50, screenCenterY - 50, 100, 100);
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);

  }

  void update(double t) {
    // TODO: implement update
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

}
