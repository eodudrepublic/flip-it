import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_it/test.dart';
import 'package:flutter/material.dart';

// 현재 문제점 :
// 1. 플립한 uid, 플립당한 uid가 각각 저장되지 않음 -> 플립할때마다 코인 소모
// 2. 플립해도 세부 내용 보이지 않음

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  int? currentUserCoin;
  Map<String, dynamic> expandedData = {};

  Future<void> updateMyFlipsAndFlippedMe(String uid) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    // my_flips 업데이트
    DocumentReference myDocRef = FirebaseFirestore.instance.collection('season_data').doc(user.uid);
    await myDocRef.update({
      'My_flips': FieldValue.arrayUnion([uid])  // Only add uid for simplicity
    });

    // flipped_me 업데이트
    DocumentReference theirDocRef = FirebaseFirestore.instance.collection('season_data').doc(uid);
    await theirDocRef.update({
      'Flipped_me': FieldValue.arrayUnion([user.uid])
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserUid == null) {
      return Scaffold(
        backgroundColor: Color(0xFF272727),
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('로그인이 되어있지 않습니다!'),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TestScreen()),
                );
              },
              child: const Text('메인화면으로 돌아가기'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF272727),
      appBar: AppBar(
        title: Text('uid: $currentUserUid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('season_data').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data!.docs.where((doc) => doc.id != currentUserUid).toList();

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ExpansionTile(
                    title: Text("UID: ${docs[index].id}"),
                    onExpansionChanged: (expanded) async {
                      if (expanded) {
                        expandedData = docs[index].data() as Map<String, dynamic>;

                        DocumentSnapshot userData = await FirebaseFirestore.instance.collection('user_data').doc(currentUserUid).get();
                        currentUserCoin = userData['coin'];

                        if (currentUserCoin! >= 500) {
                          await FirebaseFirestore.instance.collection('user_data').doc(currentUserUid).update({'coin': currentUserCoin! - 500});

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('500코인을 소모해 내용을 표시했습니다! 남은 코인 : ${currentUserCoin! - 500}'),
                          ));

                          // Firestore 업데이트
                          await updateMyFlipsAndFlippedMe(docs[index].id);
                          setState(() {});  // Force a rebuild to update the displayed data
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('coin이 충분하지 않습니다! 현재 코인 : $currentUserCoin'),
                          ));
                        }
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (currentUserCoin != null && currentUserCoin! >= 500) ? Text(jsonEncode(expandedData)) : Text('코인이 부족하여 내용을 불러올 수 없습니다.'),
                      ),
                    ],
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
