import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class LogInTest extends StatefulWidget {
  const LogInTest({super.key});

  @override
  State<LogInTest> createState() => _LogInTestState();
}

class _LogInTestState extends State<LogInTest> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> createEmailAndPassword() async {
    try {
      UserCredential _credential =
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: "abc@abc.kr", password: "1112323");
      if (_credential.user != null) {
        // user = _credential.user;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Column(
                children: [
                  Text("Server Error"),
                ],
              ),
            )
        );
      }
    } on FirebaseAuthException catch (error) {
      logger.e(error.code);
      String? _errorCode;
      switch (error.code) {
        case "email-already-in-use":
          _errorCode = error.code;
          break;
        case "invalid-email":
          _errorCode = error.code;
          break;
        case "weak-password":
          _errorCode = error.code;
          break;
        case "operation-not-allowed":
          _errorCode = error.code;
          break;
        default:
          _errorCode = null;
      }
      if (_errorCode != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(_errorCode!),
          )
        );
      }
    }
  }

  // // 익명 로그인
  // Future<void> signInWithAnonymous() async {
  //   UserCredential credential = await _firebaseAuth.signInAnonymously();
  //   if (credential.user != null) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) => AlertDialog(
  //           content: Column(
  //             children: [
  //               Text(credential.user!.uid),
  //             ],
  //           ),
  //         )
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore 회원가입 / 로그인"),
      ),
      body: Column(
        children: [
          Form(
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0))),
                child: Container(
                    padding: const EdgeInsets.all(40.0),
                    // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
                    // SingleChildScrollView으로 감싸 줌
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text('회원가입'),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(labelText: 'Enter email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(labelText: 'Enter password'),
                            keyboardType: TextInputType.text,
                            obscureText: true, // 비밀번호 안보이도록 하는 것
                          ),
                          const SizedBox(height: 10),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) => AlertDialog(
                                  //       content: Column(
                                  //         children: [
                                  //           const Text('SignUp Success!'),
                                  //           Text('ID : ${emailController.text}'),
                                  //           Text('PW : ${passwordController.text}')
                                  //         ],
                                  //       ),
                                  //     )
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              )
                          ),

                          const SizedBox(height: 30),

                          const Text('로그인'),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(labelText: 'Enter email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(labelText: 'Enter password'),
                            keyboardType: TextInputType.text,
                            obscureText: true, // 비밀번호 안보이도록 하는 것
                          ),
                          const SizedBox(height: 10),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        content: Column(
                                          children: [
                                            const Text('LogIn Success!'),
                                            Text('ID : ${emailController.text}'),
                                            Text('PW : ${passwordController.text}')
                                          ],
                                        ),
                                      )
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              )
                          )
                        ],
                      ),
                    )
                ),
              )
          )
        ],
      ),
    );
  }
}

class ReadTest extends StatefulWidget {
  const ReadTest({super.key});

  @override
  State<ReadTest> createState() => _ReadTestState();
}

class _ReadTestState extends State<ReadTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore DB에서 데이터 가져오기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('user_data').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }


            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                // return ListTile(title: Text(docs[index]['title']));
                return Card(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${docs[index]['name']} : ${docs[index]['ID']} / ${docs[index]['password']}")
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

