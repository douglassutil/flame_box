import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/components/backyard.dart';

class BoxGame extends Game {

  Size screenSize;
  double tileSize;
  Backyard background;
  List<Fly> flies;
  Random rnd;

  BoxGame() { 
    initialize(); 
  }

  void initialize() async {
    
    flies = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    spawnFly();

  }

  void spawnFly() {

    double x = rnd.nextDouble() * (screenSize.width - tileSize); 
    double y = rnd.nextDouble() * (screenSize.height - tileSize);

    flies.add(Fly(this, x, y)); 

  }

  void onTapDown(TapDownDetails d) {

    flies?.forEach((Fly fly) { 
      if (fly.flyRect.contains(d.globalPosition)) { 
        fly.onTapDown(); 
      } 
    });

  }

  void render(Canvas canvas) {

    // Desenha o backgroud
    background.render(canvas);

    // Desenha a mosca
    flies.forEach((Fly fly) => fly.render(canvas));

  }

  void update(double t) {
    background.update(t);
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

}
