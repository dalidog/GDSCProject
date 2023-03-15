//command to run pages other than main.dart:   flutter run -t lib/my_other_main.dart

import 'package:flutter/material.dart';
//import 'package:spritewidget/spritewidget.dart';

void main() {
  runApp(MaterialApp(
    title: 'BluffSaver',
    home: Intro(), //the starting page
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BluffSaver'),
          centerTitle: true,
        ),
        body: Container(
            color: Color.fromARGB(255, 133, 171, 202),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset("assets/images/logo.png"),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                  child: Text(
                    "The bluffs and cliff faces of California's Central Coast create a diverse and beautiful ecosystem that is unique to the area. However, climate-change-inducted rising sea levels, human activity, unsafe building practices, and other factors have contributed to instability and collapse of these sandstone cliff faces. Although this erosion is visible along the entirety of the coast, Isla Vista, CA, home to UC Santa Barbara's student population, is experiencing the worst of it. "
                    "\n\nIn this mobile game, users strategize about how to spend Santa Barbara County's budget most efficiently to benefit bluff restoration and preservation, to save the bluffs before sea levels rise.",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 8),
                child: ElevatedButton(
                  child: const Text('PLAY'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Game()),
                    );
                  },
                ),
              ),
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
