import 'dart:developer' as developer;

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Demo'),
        ),
        body: SnackBarDemo(),
      ),
    );
  }
}

class SnackBarDemo extends StatefulWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SnackBarPage();
  }
}

class SnackBarPage extends State<SnackBarDemo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    var controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 3000).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            /// 通过 margin 来限制 SnackBar 的大小
            // margin: EdgeInsets.fromLTRB(40.0, 54.0, 15.0, 60.0),
            /// 限制 content 在 SnackBar 的位置
            padding: EdgeInsets.fromLTRB(100.0, 54.0, 50.0, 60.0),

            /// width 和 margin 属性不能同时使用,
            /// 同时 使用 width 属性的时候, behavior 属性只能是 nackBarBehavior.floating
            width: 700,

            /// SnackBar 显示的时间
            duration: Duration(milliseconds: 2000),

            /// SnackBar 的背景色
            backgroundColor: Colors.blue,
            elevation: 30.0,

            /// StadiumBorder
            /// CircleBorder
            /// OutlinedBorder
            /// ContinuousRectangleBorder
            /// BeveledRectangleBorder
            /// RoundedRectangleBorder
            /// SnackBar 的形状
            shape: RoundedRectangleBorder(),
            content: const Text('Yay! A SnackBar!'),
            animation: animation,

            /// SnackBarBehavior.floating
            /// SnackBarBehavior.fixed
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.black,
              onPressed: () {
                developer.log("the snack bar is visible");
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}
