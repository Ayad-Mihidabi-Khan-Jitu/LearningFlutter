import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook',
      home: HomeScreen(),
    );
  }
}

///Tuto: Dart parameter- https://sarunw.com/posts/dart-parameters/
