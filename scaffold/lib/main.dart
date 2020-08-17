import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: ScaffoldWidget(),
  ));
}
/*
 Scaffold 这个控件会提供一个 App Bar, Drawer, FloatingActionBar, BottomNavigationBar
 */

class ScaffoldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScaffoldWidgetState();
  }
}

class ScaffoldWidgetState extends State<ScaffoldWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'index: 0',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    Text(
      'index: 1',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    Text(
      'index: 2',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    Text(
      'index: 3',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("App Bar Title"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      persistentFooterButtons: <Widget>[
        MaterialButton(
          child: Text('Matthew'),
          textColor: Colors.red,
          color: Colors.teal.withOpacity(0.4),
          onPressed: () {},
        ),
        MaterialButton(
          child: Text('Sagacious'),
          textColor: Colors.red,
          color: Colors.teal.withOpacity(0.4),
          onPressed: () {},
        ),
      ],
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 这里不能使用 const
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              // 添加 onTap 方法, children 的方法不能是 const,
              onTap: close,
              leading: Icon(Icons.message),
              title: Text('Message'),
            ),
            ListTile(
              onTap: close,
              leading: Icon(Icons.access_alarms),
              title: Text('Alarms'),
            ),
            ListTile(
              onTap: close,
              leading: Icon(Icons.print),
              title: Text('Print'),
            ),
            ListTile(
              onTap: close,
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Add', backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove),
              label: 'Remove',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.red),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        onTap: onItemTaped,
      ),
    );
  }

  void onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void close() {
    Navigator.pop(context);
  }
}
