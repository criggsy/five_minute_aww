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
  bool selected = false;
  void newImage() {
    setState(() {
      cycleImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          cycleImages();
        });
      },
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height - 300,
            color: selected ? Colors.red : Colors.blue,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: postsWidget(),
          ),

          // ignore: prefer_const_constructors
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
      )),
    );
  }
}
