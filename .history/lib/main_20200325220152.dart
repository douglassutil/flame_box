import 'package:flame/util.dart';
import 'package:flame_box/boxgame.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoxGame game = BoxGame();
  runApp(game.widget);
}
