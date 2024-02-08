import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoiceproject/Model_class.dart';
import 'package:invoiceproject/viewscreen.dart';

import 'cartscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<Map<String, dynamic>> listdata = [
    {
      'image': 'assets/img.png',
      'name': 'Orange',
      'price': 3.50,
      'color': Color(0xffFAD3B4),
      'about': 'About Orange',
      'desc':
          'Oranges are round, orange-coloured fruit that grow on a tree which can reach 10 metres (33 ft) high. Orange trees have dark green shiny leaves and small white flowers with five petals. The flowers smell very sweet which attracts many bees. An orange has a tough shiny orange skin that holds acid in outside layer.',

    },
    {
      'image': 'assets/img1.png',
      'name': 'Green Apple',
      'price': 4.50,
      'color': Color(0xffD7F1CA),
      'about': 'About Green Apple',
      'desc':
          'This fruit appears light green with tart, juicy and crisp flavours and hard skin with a long shelf-life as compared with other apple types. Green apples are considered healthy fruit and are used in weight management regimens due to the presence of low calories and abundant dietary potassium and fibre.'
    },
    {
      'image': 'assets/img2.png',
      'name': 'Dragon Fruit',
      'price': 4.07,
      'color': Color(0xffF8CDFA),
      'about': 'About Dragon Fruit',
      'desc':
          'We call this plant a fruit, but dragon fruit is actually considered a cactus. They have scaly skin that can be pink or yellow, while the inside flesh may be red or white with tiny, black seeds. It has a crunchy texture and sweet flavor like a kiwi or pear.'
    },
    {
      'image': 'assets/img3.png',
      'name': 'Laychee',
      'price': 5.36,
      'color': Color(0xffF9CFD1),
      'about': 'About Laychee',
      'desc':
          'The lychee is a subtropical fruit known for its delicious flavor and sweet juicy aril. It originated in southern China, where it has been cultivated for over 4000 years. The edible portion of the fruit is a white- to cream-colored translucent pulp surrounding a glossy brown seed.'
    },
    {
      'image': 'assets/img4.png',
      'name': 'Green Kiwi',
      'price': 8.50,
      'color': Color(0xffF8E4BF),
      'about': 'About Green Kiwi',
      'desc':
          'It has a thin, fuzzy, fibrous, tart but edible light brown skin and light green or golden flesh with rows of tiny, black, edible seeds. The fruit has a soft texture with a sweet and unique flavour. Kiwifruit is native to central and eastern China.'
    },
    {
      'image': 'assets/img5.png',
      'name': 'Guava',
      'price': 10.50,
      'color': Color(0xffF5EABC),
      'about': 'About Guava',
      'desc':
          'guava, (Psidium guajava), small tropical tree or shrub of the family Myrtaceae, cultivated for its edible fruits. Guava trees are native to tropical America and are grown in tropical and subtropical areas worldwide. Guava fruits are processed into jams, jellies, and preserves and are common pastry fillings.'
    },
  ];
  List<Map<String,dynamic>> cartdata=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Hii,user',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              width: 200,
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
                  // setState(() {
                  //   // cartdata.add(ModelClass(image: wid, name: name, price: price))
                  // });

                },
                icon: Icon(
                  CupertinoIcons.cart,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Explore Fruits and Berriess',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: GridView.count(
                crossAxisCount: 2,
                children: listdata
                    .map((e) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (builder) => ViewScreen(
                                    image: e['image'].toString(),
                                    colors: e['color'],
                                    name: e['name'].toString(),
                                    price: e['price'],
                                    about: e['about'].toString(),
                                    desc: e['desc'].toString(),
                                  ),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: e['color'],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage(e['image']),
                                              radius: 50)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(e['name']),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(e['price'].toString()),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
