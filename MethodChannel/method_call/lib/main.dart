import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('samples.flutter.dev/function');
  String _methodText = 'number';

  Future<void> _getBatteryLevel() async {
    String methodText;
    try {
      // final int result = await platform.invokeMethod('getMethodText');
      final int result = await platform.invokeMethod('getMethodText', 10);

      methodText = '$result';
    } on PlatformException catch (e) {
      methodText = "Failed to get : '${e.message}'";
    }

    setState(() {
      _methodText = methodText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_methodText),
          ],
        ),
      ),
    );
  }
}
