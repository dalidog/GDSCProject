import 'dart:ui' as ui;
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:image/image.dart' as img;

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
  late NodeWithSize rootNode;

  @override
  void initState() {
    super.initState();
    rootNode = NodeWithSize(const Size(1024.0, 1024.0));
  }

  @override
  Widget build(BuildContext context) {
    loadImages();
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
    house2.position = const Offset(1000, 0);
    rootNode.addChild(house2);

    var houseImage3 = images['images/house3.png'];
    Sprite house3 = Sprite.fromImage(houseImage3!);
    house3.position = const Offset(500, -50);
    rootNode.addChild(house3);

    var houseImage4 = images['images/house4.png'];
    Sprite house4 = Sprite.fromImage(houseImage4!);
    house4.position = const Offset(1500, -50);
    rootNode.addChild(house4);
  }
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 1000; //the starting value

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
            Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton.extended(
                onPressed: () => {incrementCounterBy(-100)},
                tooltip: 'buy __',
                label: const Text('relocate 1 house'),
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
              '\$$counter',
              //style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
