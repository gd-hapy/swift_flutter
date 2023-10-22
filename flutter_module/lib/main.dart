import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage(
                      title: "homePage-flutter",
                    );
                  }));
                },
                child: const Text('打开新的flutter页面')),
            const SizedBox(height: 50),
            GestureDetector(
                onTap: () {
                  appleThree();
                },
                child: const Text('回到原生页面')),
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
