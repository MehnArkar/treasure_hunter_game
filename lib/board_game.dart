import 'package:board_game/components/background_component.dart';
import 'package:board_game/components/boart_component.dart';
import 'package:board_game/helper/loader.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class BoardGame extends FlameGame{

  BackgroundComponent gameBackground = BackgroundComponent();
  late TiledComponent gameMap;
  final world = World();
  late final CameraComponent cameraComponent;
  List<PositionComponent> roadList = [];
  int currentBoatIndex = 0;
  Boat boat = Boat();
  bool isBoatMoving = false;




  @override
  Future<void> onLoad() async{
    await super.onLoad();

    add(BackgroundComponent());

    gameMap = await TiledComponent.load('map.tmx', Vector2(size.x/40,size.y/18));
    world.add(gameMap);

    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: gameMap.width,
      height: gameMap.height,
    );

    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    addAll([cameraComponent, world]);

    roadList = await addAndGetRoadSprite(gameMap, this);

    PositionComponent start = roadList.first;
    boat.position = start.position+start.size/2;

    overlays.add('game_overlay');

    add(boat);

  }

  moveBoat(int index)async{
     isBoatMoving = true;
    List<int> intList = List.generate(index, (index) => index);
    await Future.forEach(intList, (item) async{
      if(currentBoatIndex+1 < roadList.length){
        currentBoatIndex+=1;
        await boat.add(MoveToEffect(roadList[currentBoatIndex].position + roadList[currentBoatIndex].size / 2, EffectController(duration: 0.8)));
        await Future.delayed(const Duration(milliseconds: 800));
      }else{
        return;
      }
    } );
    isBoatMoving=false;


    //  for(int i in intList) {
    //   if(currentBoatIndex+1 < roadList.length-1){
    //     currentBoatIndex+=1;
    //     print(currentBoatIndex);
    //     await boat.add(MoveToEffect(roadList[currentBoatIndex].position + roadList[currentBoatIndex].size / 2, EffectController(duration: 0.8)));
    //   }else{
    //     return;
    //   }
    // }

  }

}