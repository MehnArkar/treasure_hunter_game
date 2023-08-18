import 'package:board_game/board_game.dart';
import 'package:board_game/widget/dialog/rolling_dice_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameOverlay extends StatelessWidget {
  final BoardGame game;

  const GameOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
          width: game.size.x,
          height: game.size.y,
          child: Stack(
            children: [
              Positioned(
                  right: 16,
                  bottom: 24,
                  child: InkWell(
                    onTap: (){
                      if(!game.isBoatMoving) {
                        showGeneralDialog(
                            context: context,
                            pageBuilder: (_,__,___){
                              return RollingDiceDialog(game: game);
                            });
                        // showDialog(
                        //     barrierDismissible: false,
                        //     context: context,
                        //     builder: (context) => RollingDiceDialog(game: game,)
                        // );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.2), width: 2)),
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/dice.svg'),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Roll Dice',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
