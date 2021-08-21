import 'dart:convert';
import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as pkgImg;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  static const platform = const MethodChannel('samples.flutter.dev/image');
  Image _image = Image.asset('images/sample.jpg');

  Future<void> _convertImage() async {
    try {
      final pathImage = File(
          '/Users/ryo/github/UseOpenCVwithFlutter/MethodChannel/ImageConversion/connect_image/images/icon.jpeg');
      // JPEP Decode : List of bytes -> Jpeg Image
      pkgImg.Image image = pkgImg.decodeJpg(pathImage.readAsBytesSync());
      // JPEG Encode : Image -> List<int>
      List<int> encodeJPEG = pkgImg.JpegEncoder().encodeImage(image);
      // base64 Encode : List<int> -> String(base64)
      String base64 = base64Encode(encodeJPEG);

      String result = await platform.invokeMethod('getBase64', base64);
      // base64 Decode : String(base64) -> Unit8List
      Uint8List bytes = base64Decode(result);

      setState(() {
        _image = Image.memory(bytes);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/sample.jpg'),
            ElevatedButton(
              child: Text('Convert Image'),
              onPressed: _convertImage,
            ),
            _image,
          ],
        ),
      ),
    );
  }
}
