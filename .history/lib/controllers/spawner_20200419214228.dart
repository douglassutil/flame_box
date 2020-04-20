import 'package:flame_box/box-game.dart';
import 'package:flame_box/components/fly.dart';

class FlySpawner {

  final BoxGame game;

  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7;

  int currentInterval;
  int nextSpawn;

  FlySpawner(this.game) {}

  void start() {}

  void killAll() {
    game.flies.forEach((Fly fly) => fly.isDead = true);
  }

  void update(double t) {}
  
}
