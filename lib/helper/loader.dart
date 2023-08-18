import 'package:board_game/board_game.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

addAndGetRoadSprite(TiledComponent gameMap,BoardGame game) async{
  List<PositionComponent> spriteList = [];
  final bakedGoodGroup = gameMap.tileMap.getLayer<ObjectGroup>('road');
  double mapOriginalWidth = 800;
  double mapOriginalHeight =  360;
  for(var goodBox in bakedGoodGroup!.objects){
    if(goodBox.name.isNotEmpty) {
      print(goodBox.name);
      PositionComponent sprite =  PositionComponent()
        ..position = Vector2(goodBox.x*gameMap.width/mapOriginalWidth, goodBox.y*(gameMap.height/mapOriginalHeight))
        ..width = goodBox.width*gameMap.width/mapOriginalWidth
        ..height = goodBox.height*gameMap.height/mapOriginalHeight
        ..debugMode = false;
      // await game.add(sprite);
      spriteList.add(sprite);
    }
  }
  return spriteList;
}