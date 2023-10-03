// import 'package:firebase_core/firebase_core.dart';
// import 'package:flip_it/DB/read_data.dart';
// import 'package:flip_it/DB/write_data.dart';
// import 'package:flip_it/LogIn/signin.dart';
// import 'package:flip_it/LogIn/signout.dart';
// import 'package:flip_it/LogIn/signup.dart';
// import 'package:flip_it/UI/memo_ui.dart';
// import 'package:flip_it/UI/ui1.dart';
// import 'package:flip_it/UI/ui2.dart';
// import 'package:flip_it/UI/ui3.dart';
// import 'package:flip_it/UI/ui4.dart';
// import 'package:flip_it/UI/ui5.dart';
// import 'package:flip_it/test.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'DB/firebase_options.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   // https://youtu.be/se6wKk-w8lI?t=169
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const TestScreen(),
//       routes: {
//         '/LogIn/signin': (context) => const SignIn(),
//         '/LogIn/signup': (context) => SignUp(),
//         '/DB/read_data': (context) => const ReadData(), // 이 부분이 "Read Data" 라우트를 설정합니다.
//         '/DB/write_data': (context) => const WriteData(),
//         '/LogIn/anonsignin' : (context) => const AnonSignIn(),
//         '/LogIn/signout' : (context) => const SignOut(),
//         '/UI/memo_ui' : (context) => const MemoUI(),
//         '/UI/ui1' : (context) => const UI1(),
//         '/UI/ui2' : (context) => const UI2(),
//         '/UI/ui3' : (context) => const UI3(),
//         '/UI/ui4' : (context) => const UI4(),
//         '/UI/ui5' : (context) => const UI5(),
//         // 필요한 경우 여기에 추가 라우트를 등록합니다.
//       },
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flip_it/DB/read_data.dart';
import 'package:flip_it/DB/write_data.dart';
import 'package:flip_it/LogIn/signin.dart';
import 'package:flip_it/LogIn/signup.dart';
import 'package:flip_it/UI/ui10.dart';
import 'package:flip_it/UI/ui6.dart';
import 'package:flip_it/UI/ui7.dart';
import 'package:flutter/material.dart';
import 'DB/firebase_options.dart';

import 'package:flip_it/UI/memo_ui.dart';
import 'UI/ui1.dart';
import 'UI/ui2.dart';
import 'UI/ui3.dart';
import 'UI/ui4.dart';
import 'UI/ui5.dart';
import 'package:flip_it/test.dart';

import 'UI/ui8.dart';

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
      home: Start(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UI5(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  final List<Widget> _children = [
    Center(child: UI6()),
    Center(child: UI3()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const UI4();
                  },
                ),
              );
            },
            iconSize: 40,
            icon: const Icon(Icons.person_outline),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
          child: Image.asset('assets/images/appIcon1.png'),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Layers',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}