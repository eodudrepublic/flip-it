import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_it/DB/data_structure.dart';

class WriteData extends StatefulWidget {
  const WriteData({super.key});

  @override
  _WriteDataState createState() => _WriteDataState();
}

class _WriteDataState extends State<WriteData> {
  final TextEditingController mbtiController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController fatController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();
  final TextEditingController introController = TextEditingController();
  final TextEditingController muscleController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();

  bool gender = true;
  bool smoke = false;

  bool isButtonDisabled = true; // 버튼의 활성화 상태
  // 해당 사용자가 등록한 데이터가 있는지 확인하는 변수!

  @override
  void initState() {
    super.initState();
    checkExistingData();
  }

  // 로그인된 사용자가 데이터를 이미 추가했는지 확인합니다.
  Future<void> checkExistingData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final doc = await FirebaseFirestore.instance.collection('season_data').doc(user.uid).get();
      setState(() {
        isButtonDisabled = doc.exists;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: mbtiController,
                decoration: InputDecoration(labelText: 'MBTI'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact'),
              ),
              TextField(
                controller: fatController,
                decoration: InputDecoration(labelText: 'Fat'),
              ),
              SwitchListTile(
                title: Text('Gender'),
                value: gender,
                onChanged: (bool value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              TextField(
                controller: heightController,
                decoration: InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: hobbyController,
                decoration: InputDecoration(labelText: 'Hobby'),
              ),
              TextField(
                controller: introController,
                decoration: InputDecoration(labelText: 'Intro'),
              ),
              TextField(
                controller: muscleController,
                decoration: InputDecoration(labelText: 'Muscle'),
              ),
              TextField(
                controller: relationshipController,
                decoration: InputDecoration(labelText: 'Relationship (comma separated)'),
              ),
              SwitchListTile(
                title: Text('Smoke'),
                value: smoke,
                onChanged: (bool value) {
                  setState(() {
                    smoke = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: isButtonDisabled ? null : () async {
                  AddData adder = AddData(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    mbti: mbtiController.text,
                    age: int.parse(ageController.text),
                    contact: contactController.text,
                    fat: relationshipController.text.split(','),
                    gender: gender,
                    height: int.parse(heightController.text),
                    hobby: hobbyController.text,
                    intro: introController.text,
                    muscle: relationshipController.text.split(','),
                    relationship: relationshipController.text.split(','),
                    smoke: smoke,
                    flipped_me: [],
                    my_flips: [],
                  );

                  DataAddResult result = await adder.addData();
                  if (result == DataAddResult.success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data added successfully!')));
                  } else if (result == DataAddResult.dataAlreadyExists) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have already saved the data!')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred!')));
                  }
                },
                child: Text('Add Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataAdder {
}
