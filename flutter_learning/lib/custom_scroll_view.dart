// Flutter code sample for CustomScrollView
//
// By default, if items are inserted at the "top" of a scrolling container like
// [ListView] or [CustomScrollView], the top item and all of the items below it
// are scrolled downwards. In some applications, it's preferable to have the
// top of the list just grow upwards, without changing the scroll position.
// This example demonstrates how to do that with a [CustomScrollView] with
// two [SliverList] children, and the [CustomScrollView.center] set to the key
// of the bottom SliverList. The top one SliverList will grow upwards, and the
// bottom SliverList will grow downwards.

import 'dart:developer' as developer;

import 'package:flutter/material.dart';

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];
  ScrollController scrollController = new ScrollController();
  double bottomPosition = 0;

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              // top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
            developer.log("bottom.length = ${bottom.length}");
            bottomPosition += 100;
            toBottom();
          },
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                developer.log("index = $index");
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + bottom[index] % 4 * 100],
                  height: 100,
                  child: Text('Item2222 : ${bottom[index]}'),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }

  void toTop() {
    scrollController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void toBottom() {
    developer.log("bottomPosition = $bottomPosition");
    scrollController.animateTo(bottomPosition,
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}
