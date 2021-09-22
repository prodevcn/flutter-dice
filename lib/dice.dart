import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text(
          'Dice',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(child: Image.asset('image/dice$leftDice.png')),
                  const SizedBox(width: 32.0,),
                  Expanded(child: Image.asset('image/dice$rightDice.png'))
                ],
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              buttonColor: Colors.orangeAccent,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                  });
                  showToast("Left dice: ($leftDice), Right dice: ($rightDice)");
                }, 
                child: const Icon(Icons.play_arrow),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent
                ), 
              )
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

