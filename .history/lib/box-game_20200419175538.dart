import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame_box/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flame_box/components/backyard.dart';
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/components/house-fly.dart';
import 'package:flame_box/components/hungry-fly.dart';
import 'package:flame_box/components/macho-fly.dart';
import 'package:flame_box/components/drooler-fly.dart';
import 'package:flame_box/components/agile-fly.dart';

class BoxGame extends Game {

  Size screenSize;
  double tileSize;
  Backyard background;
  List<Fly> flies;
  Random rnd;
  View activeView = View.home;

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

  void onTapDown(TapDownDetails d) {

    flies.forEach((Fly fly) { 
      if (fly.flyRect.contains(d.globalPosition)) { 
        fly.onTapDown(); 
      } 
    });

  }

  void spawnFly() {

    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025)); 
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

    switch (rnd.nextInt(5)) { 
      case 0: flies.add(HouseFly(this, x, y)); 
        break;
      case 1: flies.add(DroolerFly(this, x, y)); 
        break; 
      case 2: flies.add(AgileFly(this, x, y));
        break; 
      case 3: flies.add(MachoFly(this, x, y)); 
        break; 
      case 4: flies.add(HungryFly(this, x, y)); 
        break; 
    }

  }

  void render(Canvas canvas) {

    // Desenha o backgroud
    background.render(canvas);

    // Desenha a mosca
    flies.forEach((Fly fly) => fly.render(canvas));

  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

}
