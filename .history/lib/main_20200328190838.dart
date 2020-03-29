import 'package:flame/util.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';

import 'package:flame_box/boxgame.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  BoxGame game = BoxGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
  flameUtil.addGestureRecognizer(tapper);

}
