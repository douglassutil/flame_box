import 'package:flame/util.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';

import 'package:flame_box/box-game.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;

  runApp(game.widget);

  Flame.images.loadAll(
    <String>[ 'bg/backyard.png', 'flies/agile-fly-1.png', 'flies/agile-fly-2.png',
              'flies/agile-fly-dead.png', 'flies/drooler-fly-1.png', 'flies/drooler-fly-2.png',
              'flies/drooler-fly-dead.png', 'flies/house-fly-1.png', 'flies/house-fly-2.png', 
              'flies/house-fly-dead.png', 'flies/hungry-fly-1.png', 'flies/hungry-fly-2.png', 
              'flies/hungry-fly-dead.png', 'flies/macho-fly-1.png', 'flies/macho-fly-2.png', 
              'flies/macho-fly-dead.png']
  );

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
  flameUtil.addGestureRecognizer(tapper);

}
