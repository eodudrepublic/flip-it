import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../DB/data_structure.dart';

class TestSignUp extends StatefulWidget {
  const TestSignUp({super.key});

  @override
  _TestSignUpState createState() => _TestSignUpState();
}

class _TestSignUpState extends State<TestSignUp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _canSendEmail = false;
  bool _isAccountExist = false;
  bool _isVerified = false;
  bool _isVerificationSent = false;

  @override
  void initState() {
    super.initState();

    _idController.addListener(_updateSendButtonState);
    _passwordController.addListener(_updateSendButtonState);
    _confirmPasswordController.addListener(_updateSendButtonState);
  }

  void _updateSendButtonState() {
    bool isValidEmail = _idController.text.endsWith('@pusan.ac.kr');
    bool isPasswordMatch = _passwordController.text == _confirmPasswordController.text &&
        _passwordController.text.isNotEmpty;

    setState(() {
      _canSendEmail = isValidEmail && isPasswordMatch;
    });
  }

  Future<void> _sendVerificationEmail() async {
    try {
      final existingUserMethods = await _firebaseAuth.fetchSignInMethodsForEmail(_idController.text);

      // 이메일이 이미 사용 중인지 확인
      if (existingUserMethods.isNotEmpty) {
        // 이메일 주소로 이미 계정이 있다면 인증 이메일을 다시 보내려고 시도
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
            email: _idController.text, password: _passwordController.text);

        await userCredential.user!.sendEmailVerification();

        // Snackbar 추가
        _scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text('이미 로그인을 시도중인 계정입니다!')));
      } else {
        // 이메일 주소로 계정이 없다면 새 계정을 생성하고 인증 이메일 보내기
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
            email: _idController.text, password: _passwordController.text);

        await userCredential.user!.sendEmailVerification();
        setState(() {
          _isVerificationSent = true;
        });
      }
    } catch (e) {
      print("Error: $e");
      _scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text('오류가 발생했습니다.')));
    }
  }


  Future<void> _checkVerification() async {
    User? user = _firebaseAuth.currentUser;
    await user?.reload();
    if (user != null && user.emailVerified) {
      setState(() {
        _isVerified = true;
      });
    } else {
      _scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(content: Text('인증이 완료되지 않았습니다! 이메일을 확인하거나 인증 메일을 다시 보내주세요.')));
    }
  }

  Future<void> _signUp() async {
    if (_nameController.text.isEmpty) {
      _scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(content: Text('이름을 입력해주세요!')));
      return;
    }

    AddUserData userData = AddUserData(5000, _nameController.text, 50);
    await userData.saveToUserData(_firebaseAuth.currentUser!.uid);

    bool exists = false;
    while (!exists) {
      await Future.delayed(Duration(seconds: 1));
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('user_data').doc(_firebaseAuth.currentUser!.uid).get();
      exists = doc.exists;
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EmptyScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: _idController, decoration: InputDecoration(labelText: 'Email (@pusan.ac.kr)')),
              TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              TextField(controller: _confirmPasswordController, decoration: InputDecoration(labelText: 'Confirm Password'), obscureText: true),

              if (_isAccountExist)
                ElevatedButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EmptyScreen())), child: Text('이미 생성된 계정이 있습니다! 이메일 인증하러 가기'))
              else if (_isVerificationSent)
                ElevatedButton(onPressed: _checkVerification, child: Text('인증 완료'))
              else
                ElevatedButton(onPressed: _canSendEmail ? _sendVerificationEmail : null, child: Text('인증 번호 전송'),),

              if (_isVerified) ...[
                TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
                ElevatedButton(onPressed: _signUp, child: Text('회원가입 완료')),
              ],
            ],
          ),
        )
      );
  }
}

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Empty Screen')),
    );
  }
}
