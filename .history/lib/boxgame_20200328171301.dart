import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame_box/components/fly.dart';

class BoxGame extends Game {

  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;

  BoxGame() { 
    initialize(); 
  }

  void initialize() async {
    
    flies = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    spawnFly();

  }

  void spawnFly() {

    double x = rnd.nextDouble() * (screenSize.width - tileSize); 
    double y = rnd.nextDouble() * (screenSize.height - tileSize);

    flies.add(Fly(this, x, y)); 

  }

  void render(Canvas canvas) {

    // Desenha o backgroud
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    // Desenha a mosca
    flies?.forEach((Fly fly) => fly.render(canvas));

  }

  void update(double t) {
    flies?.removeWhere((Fly fly) => fly.isOffScreen);
    flies?.forEach((Fly fly) => fly.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {

    flies.forEach((Fly fly) { 
      if (fly.flyRect.contains(d.globalPosition)) { 
        fly.onTapDown(); 
      } 
    });

  }

}
