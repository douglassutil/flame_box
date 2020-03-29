import 'dart:ui';

import 'package:flame/sprite.dart'; 
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/box-game.dart';

class AgileFly extends Fly { 
  
  AgileFly(BoxGame game, double x, double y) : super(game) { 
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>(); 
    flyingSprite.add(Sprite('flies/agile-fly-1.png')); 
    flyingSprite.add(Sprite('flies/agile-fly-2.png')); 
    deadSprite = Sprite('flies/agile-fly-dead.png'); 
  } 
  
}
