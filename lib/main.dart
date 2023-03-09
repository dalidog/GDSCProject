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
  //widgets are the elements from which you build every Flutter app
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC Project',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'GDSC Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1000; //the starting value

  void _incrementCounterBy(int val) {
    //changes counter by a value
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += val;
    });
  }

  void setCounter(int val) {
    setState(() {
      _counter = val;
    });

class MyWidget extends StatefulWidget {
  @override
  MyWidgetState createState() => new MyWidgetState();
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
    Sprite house = Sprite.fromImage(houseImage1!);
    rootNode.addChild(house);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //return SpriteWidget(rootNode);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Align(
          alignment: Alignment.topRight,

          // children: <Widget>[
          //   const Text(
          //     'Balance: \n\$',
          //   ),
          //   Text(
          //     '$_counter',
          //     style: Theme.of(context).textTheme.headlineMedium,
          //   ),

          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              '\$$_counter',
              //style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          // ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {_incrementCounterBy(-100)},
        tooltip: 'buy __',
        child: const Text('buy more houses!'), //Icon(Icons.add),
      ),

      // children: <Widget>[
      //   Container(
      //     padding: const EdgeInsets.all(8),
      //     child: FloatingActionButton(
      //       onPressed: () => {_incrementCounterBy(-100)},
      //       tooltip: 'buy __',
      //       child: const Text('buy more houses!'), //Icon(Icons.add),
      //     ),
      //   ),

      //   Container(
      //     padding: const EdgeInsets.all(8),
      //     child: FloatingActionButton(
      //       onPressed: () => {_incrementCounterBy(-100)},
      //       tooltip: 'buy __',
      //       child: const Text('buy more houses!'), //Icon(Icons.add),
      //     ),
      //   ),

      // ],
    );
    /*  
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
            
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            
            const Text(
              'Balance: \n\$',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,

      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/gdsc_background.jpg"),
                        //fit: BoxFit.fitWidth
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 225,
                    child: Container(
                      width: 250,
                      height: 250,
                      child: MyWidget(),
                    ),
                  ),
                ],
              ),

            ),
            /*
            ElevatedButton(
              onPressed: () {
                //print('button pressed'); //in debug console
              },
              child: Text('Next'),
            ),
            */
          ],
        ),
        
      ),

      //floatingActionButton: FloatingActionButton(
      //onPressed: _incrementCounter,
      //tooltip: 'In
      //ns.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
    */
  }
}
