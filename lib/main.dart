import 'package:flutter/material.dart';
import 'package:messanger_clone/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messanger',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
