import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame_box/components/fly.dart';

class BoxGame extends Game {

  Size screenSize;
  double tileSize;
  List<Fly> flies;
  double count = 0;

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

    for (var i = 0; i < count; i++) {
      spawnFly(count+10, count+10);
    }
    
    if (count < 60) {
      count++;
    }else{
      count = 0;
    }

    

    double screenCenterX = (screenSize.width/2)-(tileSize/2);
    double screenCenterY = (screenSize.height/2)-(tileSize/2);
    Fly mosca = new Fly(this, screenCenterX, screenCenterY);
    mosca.render(canvas);

  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
  }

  void onTapDown(TapDownDetails d) {
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void spawnFly(double x, double y) { 
    flies.add(Fly(this, x, y)); 
  }

}
