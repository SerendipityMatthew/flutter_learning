import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home', backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite), label: 'favorite', backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings), label: 'Settings', backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings), label: 'hello', backgroundColor: Colors.red),
        ],
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        onTap: onItemTaped,
      ),
    );
  }

  void onItemTaped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
