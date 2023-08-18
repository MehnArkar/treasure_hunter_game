import 'package:flame/components.dart';

class Boat extends SpriteAnimationComponent{
  @override
  Future<void> onLoad() async{
    await super.onLoad();
    final spriteList = [1,2,3,4,5,6].map((i) => Sprite.load('boat$i.png'));
     animation = SpriteAnimation.spriteList(
      await Future.wait(spriteList),
      stepTime: 0.2,
    );
    size = Vector2(43, 32);
    anchor = Anchor.center;
  }
}