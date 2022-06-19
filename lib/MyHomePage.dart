import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'getImageList.dart';
import 'postsWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void newImage() {
    setState(() {
      postsWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const postsWidget(),
        Container(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            iconSize: 50.0,
            onPressed: newImage,
            icon: const Icon(Icons.favorite),
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(100),
          ),
        )
      ],
    ));
  }
}
