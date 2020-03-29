import 'package:flame/sprite.dart'; 
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/box-game.dart';

class HouseFly extends Fly { 
  
  HouseFly(BoxGame game, double x, double y) : super(game, x, y) { 
    flyingSprite = List<Sprite>(); 
    flyingSprite.add(Sprite('flies/house-fly-1.png')); 
    flyingSprite.add(Sprite('flies/house-fly-2.png')); 
    deadSprite = Sprite('flies/house-fly-dead.png'); 
  } 
  
}
