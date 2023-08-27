import 'package:flutter/material.dart';
import 'UI/ui1.dart';
import 'UI/ui2.dart';
import 'UI/ui3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UI3(),
    );
  }
}

