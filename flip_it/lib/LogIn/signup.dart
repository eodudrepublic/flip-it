import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isEmailSent = false;
  bool _isVerified = false;

  Future<void> _sendVerificationEmail() async {
    if (_idController.text.isNotEmpty) {
      try {
        String email = "${_idController.text}@pusan.ac.kr";
        final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: 'temporaryPassword'); // 임시 비밀번호 사용
        await userCredential.user?.sendEmailVerification();
        setState(() {
          _isEmailSent = true;
        });
      } catch (e) {
        print("Error sending verification email: $e");
      }
    } else {
      print("Please enter your ID.");
    }
  }

  Future<void> _checkVerification() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        setState(() {
          _isVerified = true;
        });
      } else {
        print("Please verify your email.");
      }
    }
  }

  Future<void> _signUp() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      String email = "${_idController.text}@pusan.ac.kr";
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: _passwordController.text);
        Navigator.of(context).pop(); // 혹은 다른 화면으로 이동
      } catch (e) {
        print("Error during sign up: $e");
      }
    } else {
      print("Passwords do not match.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            ElevatedButton(
              onPressed: _isEmailSent ? null : _sendVerificationEmail,
              child: Text(_isEmailSent ? '다시 보내기' : '인증 메일 보내기'),
            ),
            ElevatedButton(
              onPressed: _isEmailSent && !_isVerified ? _checkVerification : null,
              child: Text('인증 확인'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _isVerified ? _signUp : null,
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}