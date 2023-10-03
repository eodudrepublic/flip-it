import 'package:flip_it/UI/ui9.dart';
import 'package:flip_it/main.dart';
import 'package:flutter/material.dart';
import 'ui8.dart';
import 'ui3.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../DB/data_structure.dart';

class UI10 extends StatefulWidget {

  @override
  State<UI10> createState() => _UI10State();
}

class _UI10State extends State<UI10> {
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
        if (_uid != null)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UI9()),
          );
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,  // 배경색을 검은색으로 설정
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:screenWidth*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/appIcon.png', // 이미지 파일 경로
                      width: screenWidth*0.3, // 이미지의 가로 크기 설정
                      height: screenHeight*0.12, // 이미지의 세로 크기 설정
                    ),
                    SizedBox(width:screenWidth*0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '플립으로 잇다, 플립-잇.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight*0.02,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                            'FLIP-IT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight*0.05,
                              fontWeight:FontWeight.w700,
                            )
                        ),
                        Text(
                            '포스트잇으로 찾는 나의 일상 메이트',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight*0.018,
                            fontWeight: FontWeight.w300,
                          ),

                        ),
                      ]
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.05),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight*0.05,

                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: '아이디',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.012),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight*0.05,

                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.012),
                ElevatedButton(
                  onPressed: () {
                    _loginUser();
                  },  //다음 페이지로
                  child: Text('로그인'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth*0.8, screenHeight*0.045),
                    backgroundColor: Color(0xFF4B2FFE),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.01
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.012),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UI8()),
                        );
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.017,
                          decoration: TextDecoration.underline, // 밑줄 추가
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenWidth * 0.8, 0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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