import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Matthew Bottom Navigation",
    home: BottomNavigationBar3Items(),
  ));
}

class BottomNavigationBar3Items extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBar3ItemsState();
  }
}

class BottomNavigationBar3ItemsState extends State<BottomNavigationBar3Items> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: selectedIndex,
          // 必须给 currentIndex 赋 当前选中的 index（就是 item的 index） item才能点击便色
          onTap: onItemTaped,
        ));
  }

  void onItemTaped(int index) {
    setState(() {
      selectedIndex = index; // selectedIndex 赋予当前点击的 item 的 index
    });
  }
}


