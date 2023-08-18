import 'package:board_game/board_game.dart';
import 'package:board_game/widget/game_overlay.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(const MyGameApp());
}

class MyGameApp extends StatelessWidget {
  const MyGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(
          game: BoardGame(),
          overlayBuilderMap: {
            'game_overlay':(context,BoardGame game)=>GameOverlay(game: game)
          }
      )
    );
  }
}

