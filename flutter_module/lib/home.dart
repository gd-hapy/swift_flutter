import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  appleOne();
                },
                child: const Text('调用方法 appleOne')),
            const SizedBox(height: 50),
            GestureDetector(
                onTap: () {
                  appleTwo();
                },
                child: const Text('调用方法 appleTwo')),
            const SizedBox(height: 50),
            GestureDetector(
                onTap: () {
                  appleThree();
                },
                child: const Text('调用方法 appleThree')),
          ],
        ),
      ),
    );
  }
}

Future<void> appleOne() async {
  MethodChannel _channel = const MethodChannel('plugin_apple');
  final result = await _channel.invokeMethod('apple_one');
  Map map = result as LinkedHashMap<Object?, Object?>;
  print("result: ${map["data"]}");
  print("code: ${map["code"]}");
}

Future<void> appleTwo() async {
  MethodChannel _channel = const MethodChannel('plugin_apple');
  final result = await _channel.invokeMethod('apple_two');
  Map map = result as LinkedHashMap<Object?, Object?>;
  print("result: ${map["data"]}");
  print("code: ${map["code"]}");
}

Future<void> appleThree() async {
  MethodChannel _channel = const MethodChannel("plugin_apple");
  final result = await _channel.invokeMethod("close_flutter_page");
  print("result: ${result}}");
}
