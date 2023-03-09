import 'dart:ui' as ui;
import 'dart:async';
import 'dart:io';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:image/image.dart' as img;

late NodeWithSize rootNode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC Project',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'GDSC Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyWidget extends StatefulWidget {
  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    rootNode = NodeWithSize(const Size(1024.0, 1024.0));
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(rootNode);
  }

  void loadImages() async {
    ImageMap images = ImageMap();
    await images.load([
      'images/house1.png',
      'images/house2.png',
      'images/house3.png',
      'images/house4.png',
    ]);
    // Access a loaded image from the ImageMap
    var houseImage1 = images['images/house1.png'];
    Sprite house1 = Sprite.fromImage(houseImage1!);
    rootNode.addChild(house1);

    var houseImage2 = images['images/house2.png'];
    Sprite house2 = Sprite.fromImage(houseImage2!);
    house2.position = const Offset(500, -50);
    rootNode.addChild(house2);

    var houseImage3 = images['images/house3.png'];
    Sprite house3 = Sprite.fromImage(houseImage3!);
    house3.position = const Offset(1000, 0);
    rootNode.addChild(house3);

    var houseImage4 = images['images/house4.png'];
    Sprite house4 = Sprite.fromImage(houseImage4!);
    house4.position = const Offset(1500, -50);
    rootNode.addChild(house4);
  }
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 1000; //the starting value
  ImageMap images = ImageMap();
  int treeOffset = -250;
  int duneOffset = -400;
  int wallOffset = -500;

  void incrementCounterBy(int val) {
    setState(() {
      counter += val;
    });
  }

  void setCounter(int val) {
    setState(() {
      counter = val;
    });
  }

  void deleteHouse() {
    if (rootNode.children.isNotEmpty) {
      for (final child in rootNode.children) {
        if (child.position.dx % 500 == 0) {
          rootNode.removeChild(child);
          break;
        }
      }
    }
  }

  void plantTree() async {
    await images.load([
      'images/tree.png',
    ]);
    // Access a loaded image from the ImageMap
    var treeImage1 = images['images/tree.png'];
    Sprite tree1 = Sprite.fromImage(treeImage1!);
    tree1.position = Offset(treeOffset + 150, 0);
    rootNode.addChild(tree1);
    treeOffset += 150;
  }

  makeSand() async {
    await images.load([
      'images/dune.png',
    ]);
    // Access a loaded image from the ImageMap
    var duneImage1 = images['images/dune.png'];
    Sprite dune1 = Sprite.fromImage(duneImage1!);
    dune1.position = Offset(duneOffset + 350, 550);
    rootNode.addChild(dune1);
    duneOffset += 350;
  }

  makeWall() async {
    await images.load([
      'images/wall.png',
    ]);
    // Access a loaded image from the ImageMap
    for (int i = 0; i < 4; i++) {
      var wallImage1 = images['images/wall.png'];
      Sprite wall1 = Sprite.fromImage(wallImage1!);
      wall1.position = Offset(wallOffset + 600, 950);
      rootNode.addChild(wall1);
      wallOffset += 600;
    }
  }

  @override
  Widget build(BuildContext context) {
    //return SpriteWidget(rootNode);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: () => {incrementCounterBy(-100), deleteHouse()},
                    tooltip: '\$100',
                    label: const Text('relocate 10 houses:'),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () => {incrementCounterBy(-50), plantTree()},
                    tooltip: '\$50',
                    label: const Text('plant 10 trees'),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () => {incrementCounterBy(-25), makeSand()},
                    tooltip: '\$25',
                    label: const Text('create sand dune'),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () => {incrementCounterBy(-500), makeWall()},
                    tooltip: '\$500',
                    label: const Text('build sea wall'),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Container(
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/gdsc_background.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 225,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: MyWidget(),
                  ),
                ),
              ],
            ),
            Text(
              'Balance: \$$counter',
              //style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
