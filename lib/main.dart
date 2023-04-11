import 'package:flutter/material.dart';
import 'package:myapp/src/screen/MainScreens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EntApp',
      home: Initial(),
    );
  }
}

