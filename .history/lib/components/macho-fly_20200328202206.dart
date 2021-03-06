import 'package:flame/sprite.dart'; 
import 'package:flame_box/components/fly.dart';
import 'package:flame_box/box-game.dart';

class MachoFly extends Fly { 
  
  MachoFly(BoxGame game, double x, double y) : super(game, x, y) { 
    flyingSprite = List<Sprite>(); 
    flyingSprite.add(Sprite('flies/macho-fly-1.png')); 
    flyingSprite.add(Sprite('flies/macho-fly-2.png')); 
    deadSprite = Sprite('flies/macho-fly-dead.png'); 
  } 
  
}
