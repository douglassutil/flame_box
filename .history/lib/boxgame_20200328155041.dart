import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame_box/components/fly.dart';

class BoxGame extends Game {

  Size screenSize;
  double tileSize;
  List<Fly> flies;

  BoxGame() { 
    initialize(); 
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
  }

  void render(Canvas canvas) {

    // Desenha o backgroud
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // Desenha a mosca
    flies.forEach((Fly fly) => fly.render(canvas));
    
    double screenCenterX = (screenSize.width/2)-(tileSize/2);
    double screenCenterY = (screenSize.height/2)-(tileSize/2);
    Fly mosca = new Fly(this, screenCenterX, screenCenterY);
    mosca.render(canvas);

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
