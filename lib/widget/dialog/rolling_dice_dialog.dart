import 'dart:math';
import 'package:board_game/board_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RollingDiceDialog extends StatelessWidget {
  final BoardGame game;
  const RollingDiceDialog({super.key,required this.game});

  @override
  Widget build(BuildContext context) {
    Rx<bool> isRolled = false.obs;
    int diceNum = Random().nextInt(5)+1;
    Future.delayed(const Duration(milliseconds: 1500)).then((value){
      isRolled.value=true;
      Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        Navigator.of(context).pop();
        game.moveBoat(diceNum);
      });
    });
    return Obx(
        ()=> Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
              width: 150,
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: isRolled.value?
              SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/dice/dice$diceNum.png')):
              SizedBox(
                  width: 72,
                  height: 72,
                  child: Image.asset('assets/images/throw_dice.gif')),
            ),
        )

      ),
    );
  }
}
