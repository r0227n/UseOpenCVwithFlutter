import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as pkgImg;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _convertImage() {
    final pathImage = File(
        '/Users/ryo/github/UseOpenCVwithFlutter/MethodChannel/ImageConversion/check_image_conversion/image/icon.jpeg');

    // JPEP Decode : List of bytes -> Jpeg Image
    pkgImg.Image image = pkgImg.decodeJpg(pathImage.readAsBytesSync());
    // JPEG Encode : Image -> List<Int>
    List<int> jpg = pkgImg.JpegEncoder().encodeImage(image);
    // List<Int> -> Unit8List
    Uint8List bytesList = Uint8List.fromList(jpg);
    setState(() {
      // Unit8List -> Image
      _image = Image.memory(bytesList);
    });
  }

  Image _image = Image.asset('image/sample.jpg');

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
            Image.asset('image/sample.jpg'),
            _image,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _convertImage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
