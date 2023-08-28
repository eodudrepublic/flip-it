import 'package:flip_ui/ui1.dart';
import 'package:flip_ui/ui2.dart';
import 'package:flip_ui/ui3.dart';
import 'package:flip_ui/ui4.dart';
import 'package:flip_ui/ui5.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: UI5()),
    );
  }
}
