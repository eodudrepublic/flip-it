import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../DB/data_structure.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _uid; // <-- UID를 저장할 변수

  Future<void> _loginUser() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      setState(() {
        _uid = userCredential.user?.uid; // <-- UID 저장
      });
    } catch (e) {
      print("An error occurred while logging in: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while logging in'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _loginUser,
              child: Text('Login'),
            ),

            // UID 출력
            if (_uid != null)
              Text('uid: $_uid'),
          ],
        ),
      ),
    );
  }
}

class AnonSignIn extends StatefulWidget {
  const AnonSignIn({super.key});

  @override
  _AnonSignInState createState() => _AnonSignInState();
}

class _AnonSignInState extends State<AnonSignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid; // <-- UID를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('테스트용 : 익명 로그인')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Sign in Anonymously'),
              onPressed: _signInAnonymously,
            ),
            // UID 출력
            if (_uid != null)
              Text('uid: $_uid'),
          ],
        ),
      ),
    );
  }

  Future<void> _signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();

      setState(() {
        _uid = userCredential.user?.uid; // <-- UID 저장
      });

      // Firestore에 사용자 정보 저장
      User? user = userCredential.user;
      if (user != null) {
        AddUserData userData = AddUserData(5000, 'Anonymous', 50); // 익명 사용자의 경우 이름을 'Anonymous'로 설정
        await userData.saveToUserData(user.uid);
      }

      print('Signed in with uid: ${userCredential.user!.uid}');
    } catch (e) {
      print('Error: $e');
    }
  }
}