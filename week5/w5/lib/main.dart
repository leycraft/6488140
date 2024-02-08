import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route ␣ Push ␣ Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstRoute(),
// Initially FirstRoute
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Page'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Text(
          'Recipe List',
          style: TextStyle(fontSize: 50),
        ),
        ProductBox(
                name: "Burger",
                description: "Hamburgers are often sold at fast-food restaurants and diners, but are also sold at various other restaurants.",
                image: "burger.jpg"),
        ElevatedButton(
            child: const Text('View descrption'),
            onPressed: () {
              //todo 1
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                      data: 'A hamburger or simply burger is a food consisting of fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a "special sauce", often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.'),
                ),
              );
            })
      ])),
    );
  }
}

class SecondPage extends StatelessWidget {
// This is a String for the sake of an example .
// You can use any type you want .
// TODO 2: Create data as String HERE
  final String data;
  SecondPage(
      {Key? key,
// TODO 3: define data as argument of constructor HERE
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description page '),
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Image.asset("appimages/burger.jpg"),
          Text(
            data,
            //style: TextStyle(fontSize: 50),
          ),

        ],
      )),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("appimages/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                        ],
                      )))
            ])));
  }
}

