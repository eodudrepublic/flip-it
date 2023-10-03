import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class ReadTest extends StatefulWidget {
  const ReadTest({super.key});

  @override
  State<ReadTest> createState() => _ReadTestState();
}

class _ReadTestState extends State<ReadTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272727),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
          FirebaseFirestore.instance.collection('season_data').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data!.docs;
            return GridView.builder(
// Text("${docs[index]['name']} : ${docs[index]['ID']} / ${docs[index]['password']}")
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 각 행에 표시될 아이템 수
                mainAxisSpacing: 20.0, // 수직 간격
                crossAxisSpacing: 20.0, // 수평 간격
                childAspectRatio: 1.5, // 가로:세로 = 1:1
              ),
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[700], // 노란색 배경
                      borderRadius: BorderRadius.circular(20.0), // 둥근 테두리
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: '${docs[index]['age']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' • ', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '${docs[index]['MBTI']}', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                            child: Container(
                              width: 340.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF5EFF),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text('${docs[index]['intro']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent, // 이 부분을 추가
                      builder: (BuildContext context) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            // 흐릿한 배경
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  // color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ),
                            // 팝업 내용
                            AlertDialog(
                              backgroundColor: Colors.yellow[700],
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '📏',
                                  ),
                                  Text('${docs[index]['height']}'+'cm',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '체형 ' + '${docs[index]['fat'][0]}' + ', ' + '${docs[index]['muscle'][0]}',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '🎨\n' + '${docs[index]['hobby']}' + ' 좋아함',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '💗',
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '다투고 난 후엔 ',
                                      ),
                                      Text(
                                        '${docs[index]['relationship'][0]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '개인 시간은  ',
                                      ),
                                      Text(
                                        '${docs[index]['relationship'][1]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '자율성은 ',
                                      ),
                                      Text(
                                        '${docs[index]['relationship'][2]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '🚬',
                                  ),
                                  Text(
                                    docs[index]['smoke'] ? "흡연" : "비흡연",
                                  ),
                                ],
                              ),
                              actions: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color(0xFF4B2FFE)),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierColor: Colors.transparent,
                                          // 이 부분을 추가
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                              Colors.black.withOpacity(0.8),
                                              content: Container(
                                                child: Text(
                                                  "500 잇-코인",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              actions: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                          Color(
                                                              0xFF4B2FFE)),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text(
                                                        'ⓒ 잇-코인으로 열어보기',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text(
                                                        '닫기',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Flip!',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        '닫기',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
// Text("${docs[index]['name']} : ${docs[index]['ID']} / ${docs[index]['password']}")
