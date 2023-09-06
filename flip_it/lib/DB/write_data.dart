import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  void addData() async {
    FirebaseFirestore.instance.collection('season_data').doc('test').set({
      'MBTI': mbtiController.text,
      'age': int.parse(ageController.text),
      'contact': contactController.text,
      'fat': [fatController.text],
      'gender': gender,
      'height': int.parse(heightController.text),
      'hobby': hobbyController.text,
      'intro': introController.text,
      'muscle': [muscleController.text],
      'relationship': relationshipController.text.split(','), // Comma separated
      'smoke': smoke,
    });
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
                onPressed: addData,
                child: Text('Add Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
