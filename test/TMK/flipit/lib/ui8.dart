import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Verif2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UI8(),
    );
  }
}

class UI8 extends StatefulWidget {
  const UI8({super.key});

  @override
  State<UI8> createState() => _UI8State();
}

class _UI8State extends State<UI8> {
  final TextEditingController _emailController = TextEditingController();
  List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  bool _isVerificationVisible = false;
  int _secondsRemaining = 180;
  Timer? _timer;

  void _toggleVerificationVisibility() {
    if (_isVerificationVisible) {
      _cancelTimer();
    }
    setState(() {
      _isVerificationVisible = !_isVerificationVisible;
      if (_isVerificationVisible) {
        startTimer();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimer();
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get timerText {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minutesStr:$secondsStr';
  }

  void startTimer() {
    _cancelTimer(); // Cancel previous timer if any

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        _cancelTimer();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이메일',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: '부산대 이메일 아이디',
                          ),
                        ),
                      ),
                      Text('@pusan.co.kr'),
                      SizedBox(width: 15.0),
                      ElevatedButton(
                        onPressed: _toggleVerificationVisibility,
                        child: Text('본인인증'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4B2FFE),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenHeight * 0.01),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_isVerificationVisible)
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        color: Color(0xFFE5E5E5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '이메일로 전송된 인증번호를 아래에 입력해줘.',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '아직 인증번호를 받지 못했다면?',
                                    style: TextStyle(
                                      color: Color(0xFF7D7D7D),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _secondsRemaining = 180;
                                      });
                                      startTimer();
                                    },
                                    child: Text('재전송'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFC8C8C8),
                                      foregroundColor: Color(0xFF7D7D7D),
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _buildCodeInput(),
                              SizedBox(height: screenHeight * 0.015),
                              Text(
                                timerText,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              ElevatedButton(
                                onPressed: (){
                                  _cancelTimer();
                                  _toggleVerificationVisibility(); //데이터 전송 + 인증 완료 후 이게 작동되어야 함
                                },
                                child: Text('확인'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF4B2FFE),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 30.0,
              child: TextField(
                controller: _controllers[i],
                maxLength: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value.isNotEmpty && i < 5) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}