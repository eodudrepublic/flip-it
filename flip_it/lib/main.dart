import 'package:firebase_core/firebase_core.dart';
import 'package:flip_it/DB/read_data.dart';
import 'package:flip_it/DB/write_data.dart';
import 'package:flip_it/LogIn/signin.dart';
import 'package:flip_it/LogIn/signup.dart';
import 'package:flutter/material.dart';
import 'DB/firebase_options.dart';

import 'package:flip_it/UI/memo_ui.dart';
import 'UI/ui1.dart';
import 'UI/ui2.dart';
import 'UI/ui3.dart';
import 'UI/ui4.dart';
import 'UI/ui5.dart';
import 'package:flip_it/test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // https://youtu.be/se6wKk-w8lI?t=169
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: SafeArea(child: SignUp()),
      ),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}