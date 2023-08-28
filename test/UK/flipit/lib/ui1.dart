import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UI1 extends StatefulWidget {
  const UI1({super.key});

  @override
  State<UI1> createState() => _UI1State();
}

class _UI1State extends State<UI1> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _controller_ideal = TextEditingController();
  TextEditingController _controller_age = TextEditingController();
  TextEditingController _controller_MBTI = TextEditingController();
  bool _hasError = false;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller_MBTI.addListener(() {
      // 입력된 텍스트를 대문자로 변경
      String text = _controller_MBTI.text.toUpperCase();
      _controller_MBTI.value = _controller_MBTI.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.08,
                fit: BoxFit.contain, // 이미지가 컨테이너 안에 맞게 들어감
              ),
              Text(
                "<연애!>에 온 걸 환영해!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "포스티잇 앞면에 보여질 기본 정보야.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // 너비 설정
                height: MediaQuery.of(context).size.height * 0.375, // 높이 설정
                decoration: BoxDecoration(
                  color: Colors.yellow[700], // 노란색 배경
                  borderRadius: BorderRadius.circular(50.0), // 둥근 테두리
                ),
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width:
                              MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height *
                              0.05, // 높이 설정
                          child: TextFormField(
                            controller: _controller_age,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "나이를 입력해줘!!";
                              }

                              int? number = int.tryParse(value);
                              if (number == null) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "나이를 입력해줘!!";
                              }
                              if (number < 15 || number > 40) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 나이를 입력해줘!!";
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9\d]')),
                            ],
                            decoration: InputDecoration(
                              hintText: "나이는?",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height *
                              0.05, // 높이 설정
                          child: TextFormField(
                            controller: _controller_MBTI,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "MBTI를 입력해줘!!";
                              }
                              if (value.length < 4 || value.length > 4) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 MBTI를 입력해줘!!";
                              }
                              if (value[0] == 'I' || value[0] == 'E') {
                                if (value[1] == 'N' || value[1] == 'S') {
                                  if (value[2] == 'F' || value[2] == 'T') {
                                    if (value[3] == 'J' || value[3] == 'P') {
                                      return null;
                                    } else {
                                      setState(() {
                                        _hasError = true;
                                      });
                                      return "제대로 MBTI를 입력해줘!!";
                                    }
                                  } else {
                                    setState(() {
                                      _hasError = true;
                                    });
                                    return "제대로 MBTI를 입력해줘!!";
                                  }
                                } else {
                                  setState(() {
                                    _hasError = true;
                                  });
                                  return "제대로 MBTI를 입력해줘!!";
                                }
                              } else {
                                setState(() {
                                  _hasError = true;
                                });
                                return "제대로 MBTI를 입력해줘!!";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z\d]')),
                            ],
                            decoration: InputDecoration(
                              hintText: "MBTI 를 말해줘",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width * 0.65, // 너비 설정
                          height: MediaQuery.of(context).size.height *
                              0.05, // 높이 설정
                          child: TextFormField(
                            controller: _controller_ideal,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (_hasError) return null;
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "MBTI를 입력해줘!!";
                              }
                              if (value.length < 20 || value.length > 5) {
                                setState(() {
                                  _hasError = true;
                                });
                                return "5글자는 입력해줘!!ㅠ";
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z\d]')),
                            ],
                            decoration: InputDecoration(
                              hintText: "너의 이상형에 대해 설명해줘! ex. 영화같이 몰아볼 다정한 사람",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              fillColor: Color(0xFFFF5EFF),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.3, // 너비 설정
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: customRadio("남자", 0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.3, // 너비 설정
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: customRadio("여자", 1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '사람들이 보게 될 포스트잇이야!',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // 너비 설정
                height: MediaQuery.of(context).size.height * 0.2, // 높이 설정
                decoration: BoxDecoration(
                  color: Colors.yellow[700], // 노란색 배경
                  borderRadius: BorderRadius.circular(50.0), // 둥근 테두리
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 25,
                            child: TextField(
                              textAlign: TextAlign.left,
                              enabled: false,
                              // true 하면 수정됨!
                              controller: _controller_age,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "·",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 25,
                            child: TextField(
                              textAlign: TextAlign.center,
                              enabled: false,
                              // true 하면 수정됨!
                              controller: _controller_MBTI,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 340.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF5EFF),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                textAlign: TextAlign.left,
                                enabled: false,
                                // true 하면 수정됨!
                                controller: _controller_ideal,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B2FFE)),
                child: Container(
                  width: 150.0,
                  height: 55.0,
                  child: Center(
                    child: Text(
                      "다음",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    setState(() {
      _hasError = false;
    });

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("저장되었습니다."),
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return SizedBox(
      width: 170,
      height: 48,
      child: OutlinedButton(
        onPressed: () => changeIndex(index),
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            side: BorderSide(
                color: selectedIndex == index ? Colors.cyan : Colors.white),
            backgroundColor: Colors.white),
        child: Text(
          txt,
          style: TextStyle(
            color: selectedIndex == index ? Colors.cyan : Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
