class Dating {
  Dating(this.uid, this.age, this.mbti, this.intro, this.gender, this.height, this.fat, this.muscle, this.hobby, this.relationship, this.smoke, this.contact);
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

  // int count;
  // int limit;
}