import 'package:flame/sprite.dart'; 
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/box-game.dart';

class HungryFly extends Fly { 
  
  HungryFly(BoxGame game, double x, double y) : super(game, x, y) { 
    flyingSprite = List<Sprite>(); 
    flyingSprite.add(Sprite('flies/hungry-fly-1.png')); 
    flyingSprite.add(Sprite('flies/hungry-fly-2.png')); 
    deadSprite = Sprite('flies/hungry-fly-dead.png'); 
  } 
  
}
