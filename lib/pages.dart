//command to run pages other than main.dart:   flutter run -t lib/my_other_main.dart

import 'package:flutter/material.dart';
//import 'package:spritewidget/spritewidget.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Intro Page',
    home: Intro(), //the starting page
  ));
}

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Starting Page'),
        ),
        body: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
              "assets/images/bluffImage.jpg"), //replace with BluffSaver logo
          ElevatedButton(
            child: const Text('PLAY'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Game()),
              );
            },
          )
        ])));
  }
}

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BluffSaver Game'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('back'),
        ),
      ),
    );
  }
}
