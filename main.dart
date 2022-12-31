import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 3, 24, 92), //0xff0061a//
        shadowColor: Color.fromARGB(15, 21, 48, 158), //0xff001456//
        splashColor: const Color(0xff4169e8),
      ),
      home: HomePage(),
    );
  }
}
