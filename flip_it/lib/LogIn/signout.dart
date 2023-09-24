import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignOut extends StatefulWidget {
  const SignOut({super.key});

  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<User?>(
              stream: _auth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;
                  if (user == null) {
                    return const Text('로그인되어있지 않습니다!');
                  } else {
                    return Text('UID : ${user.uid}');
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            StreamBuilder<User?>(
              stream: _auth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;
                  return ElevatedButton(
                    onPressed: user == null
                        ? null
                        : () async {
                      await _auth.signOut();
                      setState(() {});  // 상태 갱신
                    },
                    child: const Text('로그아웃'),
                  );
                } else {
                  return const SizedBox.shrink();  // 아무것도 표시되지 않는 위젯 반환
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
