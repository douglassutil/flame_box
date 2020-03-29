import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flame_box/boxgame.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  BoxGame game = BoxGame();
  runApp(game.widget);
  
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

}
