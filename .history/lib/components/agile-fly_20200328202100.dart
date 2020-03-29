import 'package:flame/sprite.dart'; 
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/box-game.dart';

class DroolerFly extends Fly { 
  
  DroolerFly(BoxGame game, double x, double y) : super(game, x, y) { 
    flyingSprite = List<Sprite>(); 
    flyingSprite.add(Sprite('flies/drooler-fly-1.png')); 
    flyingSprite.add(Sprite('flies/drooler-fly-2.png')); 
    deadSprite = Sprite('flies/drooler-fly-dead.png'); 
  } 
  
}
