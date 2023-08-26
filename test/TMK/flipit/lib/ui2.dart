import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UI2 extends StatefulWidget {
  const UI2({super.key});

  @override
  State<UI2> createState() => _UI2State();
}

class _UI2State extends State<UI2> {
  final formKey = GlobalKey<FormState>();
  bool _hasError = false;

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
              Text(
                "\"연애!\"에 온 걸 환영해!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "상대가 \"플립\" 하면 포스트잇 뒷면에 공개될 상세 정보야.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400.0, // 너비 설정
                height: 600.0, // 높이 설정
                decoration: BoxDecoration(
                  color: Colors.yellow[700], // 노란색 배경
                  borderRadius: BorderRadius.circular(60.0), // 둥근 테두리
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "키를 입력해줘!!";
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9\d]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "키",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "체형을 입력해줘!!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "체형",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "취미를 입력해줘!!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "취미",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "연애스타일을 입력해줘!!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "연애스타일 (밸런스 게임 3문 3답)",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "흡연여부를 입력해줘!!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "흡연 vs 비흡연",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "데이트할 때 집이 좋아? 나가는 게 좋아?";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "집 데이트 vs 나들이",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (_hasError) return null;
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return "주량을 입력해줘!!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "주량",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
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

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
}
