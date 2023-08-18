import 'package:flame/components.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef{

  @override
  Future onLoad() async{
    sprite = await gameRef.loadSprite('map.png');
    size = gameRef.size;
    return super.onLoad();
  }

}