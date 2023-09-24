import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_it/test.dart';
import 'package:flutter/material.dart';
import 'data_structure.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  int? currentUserCoin;
  Map<String, dynamic> expandedData = {};
  String? currentlyExpandedUid;

  final FlipSeasonData _firebaseService = FlipSeasonData();

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
        // season_data를 불러오는 stream
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
                  // 익명으로 로그인하든, 이메일로 로그인하든 로그인하고 Write Data해야 타일 확장가능
                  // -> 어차피 내 포스트잇 등록한 후에 보드로 넘어가니 상관없다고 판단했음
                  child: ExpansionTile(
                    initiallyExpanded: currentlyExpandedUid == docs[index].id,  // Keep the tile expanded based on the UID
                    title: Text("UID: ${docs[index].id}"),
                    onExpansionChanged: (expanded) async {
                      if (expanded) {
                        currentlyExpandedUid = docs[index].id;
                        expandedData = docs[index].data() as Map<String, dynamic>;

                        currentUserCoin = await _firebaseService.getCurrentUserCoin(currentUserUid!);
                        await _firebaseService.updateMyFlipsAndFlippedMe(docs[index].id);
                        setState(() {});  // Force a rebuild to update the displayed data
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(jsonEncode(expandedData)),
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

