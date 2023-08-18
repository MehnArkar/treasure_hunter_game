import 'package:board_game/components/background_component.dart';
import 'package:board_game/components/boart_component.dart';
import 'package:board_game/helper/loader.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class BoardGame extends FlameGame with TapDetector{
  BackgroundComponent gameBackground = BackgroundComponent();
  final world = World();
  late final CameraComponent cameraComponent;
  List<PositionComponent> roadList = [];
  int currentIndex = 0;
  Boat boat = Boat();




  @override
  Future<void> onLoad() async{
    await super.onLoad();
    add(BackgroundComponent());

    final TiledComponent gameMap = await TiledComponent.load('map.tmx', Vector2(size.x/40,size.y/18));
    world.add(gameMap);

    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: gameMap.width,
      height: gameMap.height,
    );

    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    // cameraComponent.follow(george);

    addAll([cameraComponent, world]);
    roadList = await addAndGetRoadSprite(gameMap, this);

    PositionComponent start = roadList.first;
    boat.position = start.position+start.size/2;

    add(boat);

  }

  @override
  void onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp
    super.onTapUp(info);

    if(currentIndex<roadList.length-1) {
      currentIndex = currentIndex+1;
    }else{
      currentIndex = 0;
    }
    boat.add(MoveToEffect(roadList[currentIndex].position+roadList[currentIndex].size/2, EffectController(duration: 0.8)));

  }
}