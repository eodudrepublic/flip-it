import 'package:flutter/material.dart';
import 'package:flip_it/_core/app_size.dart';
import 'package:flip_it/main_screen.dart';
import 'package:provider/provider.dart';

class InitialApp extends StatelessWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return const MainScreen();
  }
}
