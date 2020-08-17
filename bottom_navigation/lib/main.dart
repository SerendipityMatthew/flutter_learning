import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Matthew Bottom Navigation",
    home: BottomNavigationBar4ItemsCenter(),
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

class BottomNavigationBar4Items extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBar4ItemsState();
  }
}

class BottomNavigationBar4ItemsState extends State<BottomNavigationBar4Items> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor:
                  Colors.red, // 给 每一个item 背景颜色, 这样就不会出现 item 图标的颜色和 背景色一样的情况
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.red,
            ),
          ],
          currentIndex: selectedIndex,
          // 必须给 currentIndex 赋 当前选中的 index（就是 item的 index） item才能点击便色
          onTap: onItemTaped,
          // 默认是 shifting 类型的, 点击之后，当前的item的控件变大
          // 改成 fixed 类型的, item 的背景色无效, 点击 item之后, 可以变色.
          type: BottomNavigationBarType.fixed,
        ));
  }

  void onItemTaped(int index) {
    setState(() {
      selectedIndex = index; // selectedIndex 赋予当前点击的 item 的 index
    });
  }
}

class BottomNavigationBar4ItemsCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBar4ItemsCenterState();
  }
}

class BottomNavigationBar4ItemsCenterState
    extends State<BottomNavigationBar4ItemsCenter> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w100),
    ),
    Text(
      'Index 1: Favorite',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
    ),
    Text(
      'Index 2: List',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 3: Settings',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          // 在 界面的中间, 显示控件
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor:
                  Colors.red, // 给 每一个item 背景颜色, 这样就不会出现 item 图标的颜色和 背景色一样的情况
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.red,
            ),
          ],
          currentIndex: selectedIndex,
          // 必须给 currentIndex 赋 当前选中的 index（就是 item的 index） item才能点击便色
          onTap: onItemTaped,
          // 默认是 shifting 类型的, 点击之后，当前的item的控件变大
          // 改成 fixed 类型的, item 的背景色无效, 点击 item之后, 可以变色.
          type: BottomNavigationBarType.fixed,
        ));
  }

  void onItemTaped(int index) {
    setState(() {
      selectedIndex = index; // selectedIndex 赋予当前点击的 item 的 index
    });
  }
}
