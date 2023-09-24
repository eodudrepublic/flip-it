import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 데이터 추가 (AddData) 정의
// 로그인된 사용자의 season_data가 있는지 확인하는 코드는 write_data의 checkExistingData메서드 확인
class AddData extends SeasonDataFormat {
  AddData({
    required String uid,
    required int age,
    required String mbti,
    required String intro,
    required bool gender,
    required int height,
    required List<String> fat,
    required List<String> muscle,
    required String hobby,
    required List<String> relationship,
    required bool smoke,
    required String contact,
    required List<String> flipped_me,
    required List<String> my_flips,
  }) : super(uid, age, mbti, intro, gender, height, fat, muscle, hobby, relationship, smoke, contact, flipped_me, my_flips);

  Future<DataAddResult> addData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return DataAddResult.userNull;
    }

    final doc = await FirebaseFirestore.instance.collection('season_data').doc(user.uid).get();
    if (doc.exists) {
      return DataAddResult.dataAlreadyExists;
    } else {
      try {
        await FirebaseFirestore.instance.collection('season_data').doc(user.uid).set({
          'UID': uid,
          'MBTI': mbti,
          'age': age,
          'contact': contact,
          'fat': fat,
          'gender': gender,
          'height': height,
          'hobby': hobby,
          'intro': intro,
          'muscle': muscle,
          'relationship': relationship,
          'smoke': smoke,
          'Flipped_me': flipped_me,
          'My_flips': my_flips,
        });
        return DataAddResult.success;
      } catch (e) {
        print("Error adding document: $e");
        return DataAddResult.unknownError;
      }
    }
  }
}

// 데이터 포맷 정의
class SeasonDataFormat {
  SeasonDataFormat(this.uid, this.age, this.mbti, this.intro, this.gender, this.height, this.fat, this.muscle, this.hobby, this.relationship, this.smoke, this.contact, this.flipped_me, this.my_flips);

  String uid;

  int age;
  String mbti;
  String intro;
  bool gender; // true : male, false : female
  int height;
  List<String> fat;
  List<String> muscle;
  String hobby;
  List<String> relationship;
  bool smoke;
  String contact;

  List<String> flipped_me;
  List<String> my_flips;
}

// 데이터 추가 결과 (성공 및 오류)를 표현하기 위한 열거형
enum DataAddResult {
  success,
  dataAlreadyExists,
  userNull,
  unknownError,
}