import 'dart:ui';
import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame_box/components/credits-button.dart';
import 'package:flame_box/components/help-button.dart';
import 'package:flame_box/components/start-button.dart';
import 'package:flame_box/controllers/spawner.dart';
import 'package:flame_box/views/lost-view.dart';

import 'package:flutter/gestures.dart';

import 'package:flame_box/view.dart';
import 'package:flame_box/views/home-view.dart';
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
  FlySpawner spawner;
  Random rnd;

  View activeView = View.home;
  HomeView homeView;
  LostView lostView;
  StartButton startButton;
  HelpButton helpButton;
  CreditsButton creditsButton;

  BoxGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    homeView = HomeView(this);
    startButton = StartButton(this);
    lostView = LostView(this);
    helpButton = HelpButton(this);
    creditsButton = CreditsButton(this);

    spawner = FlySpawner(this);
    
  }

  void onTapDown(TapDownDetails d) {

    bool isHandled = false;

    // Botão help
    if (!isHandled && helpButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        helpButton.onTapDown();
        isHandled = true;
      }
    }

    // Botão credits
    if (!isHandled && creditsButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        creditsButton.onTapDown();
        isHandled = true;
      }
    }

    // Botão start
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    // Moscas
    if (!isHandled) {

      bool didHitAFly = false;

      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          didHitAFly = true;
          isHandled = true;
        }
      });

      if (activeView == View.playing && !didHitAFly) {
        activeView = View.lost;
      }

    }

  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void render(Canvas canvas) {
    // Desenha o backgroud
    background.render(canvas);

    // Desenha a mosca
    flies.forEach((Fly fly) => fly.render(canvas));

    // Desenha a tela de Home
    if (activeView == View.home) 
      homeView.render(canvas);

    // Desenha a tela de Derrota
    if (activeView == View.lost) 
      lostView.render(canvas);

    // Desenha o Botão de Start
    if (activeView == View.home || activeView == View.lost){
      startButton.render(canvas);
      helpButton.render(canvas);
      creditsButton.render(canvas);
    }
    
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    spawner.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }
}
