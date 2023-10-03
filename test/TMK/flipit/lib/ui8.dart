import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'ui9.dart';

class UI8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  bool _isVerificationVisible = false;
  bool _isVerificationButtonPressed = false;
  int _secondsRemaining = 180;
  Timer? _timer;

  void _toggleVerificationVisibility() {
    if (_isVerificationButtonPressed) {
      return;  // 본인인증 버튼은 단 한 번만 누를 수 있도록 설정
    }
    if (_isVerificationVisible) {
      _cancelTimer();
    }
    setState(() {
      _isVerificationVisible = !_isVerificationVisible;
      if (_isVerificationVisible) {
        startTimer();
      }
    });
    _isVerificationButtonPressed = true;
  }

  void _handleConfirmation() {
    if (_isVerificationVisible) {
      _toggleVerificationVisibility();
    }
    // 여기에 확인 버튼을 눌렀을 때 해야할 동작 추가
    // 일치하면 인증번호창 접히고, 본인인증 버튼이 Text('인증 성공 ✓', style: TextStyle(color: Color(0xFF4B2FFE)) 으로 바뀌고
    // 불일치하면 일치하지 않으니 재입력하라는 메시지가 인증번호창 내에 뜨도록
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
  bool isPasswordValid(String password) {
    // 대문자 포함, 최소 8글자, 최대 16글자
    final RegExp regex = RegExp(r'^(?=.*[A-Z])(.{8,16})$');
    return regex.hasMatch(password);
  }

  bool get isConfirmationButtonEnabled {
    return _emailController.text.isNotEmpty && //본인인증이 인증완료 되었을 때로 변경해야함
        isPasswordValid(_passwordController.text) &&
        _checkController.text.isNotEmpty &&
        _passwordController.text == _checkController.text &&
        _nameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*0.028, vertical:screenHeight*0.001),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '회원가입',
                style: TextStyle(
                  fontSize: screenHeight*0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02, vertical:screenHeight*0.0015),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical:screenHeight*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이메일',
                    style: TextStyle(
                      fontSize: screenHeight*0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight*0.043,
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: '부산대 이메일 아이디',
                              hintStyle: TextStyle(fontSize: screenHeight*0.017),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF4B2FFE)),
                              ),
                            ),
                            style: TextStyle(fontSize:screenHeight*0.02),
                          ),
                        ),
                      ),
                      Text('@pusan.co.kr'),
                      SizedBox(width: screenWidth*0.03),
                      ElevatedButton(
                        onPressed: (){
                          if(_emailController.text.isNotEmpty){
                            _toggleVerificationVisibility();
                          }
                          else null;
                        },
                        child: Text('본인 인증'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth*0.18, screenHeight*0.045),
                          textStyle: TextStyle(fontSize: screenHeight*0.017, fontWeight:FontWeight.w700),
                          backgroundColor: _emailController.text.isNotEmpty ? Color(0xFF4B2FFE) : Color(0xFFE5E5E5),
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
                      padding: EdgeInsets.only(top: screenHeight*0.017),
                      child: Container(
                        color: Color(0xFFE5E5E5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal:screenWidth*0.028,vertical:screenHeight*0.015),
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '이메일로 전송된 인증번호를 아래에 입력해줘.',
                                    style: TextStyle(fontSize: screenHeight*0.017, fontWeight:FontWeight.w500)
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '아직 인증번호를 받지 못했다면?',
                                    style: TextStyle(
                                      fontSize: screenHeight*0.0165,
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
                                      minimumSize: Size(screenWidth*0.125, screenHeight*0.04),
                                      textStyle: TextStyle(fontSize:screenHeight*0.015),
                                      backgroundColor: Color(0xFFC8C8C8),
                                      foregroundColor: Color(0xFF7D7D7D),
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth*0.01,
                                        vertical: screenHeight*0.01,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //SizedBox(height: screenHeight * 0.005),
                              _buildCodeInput(context),
                              SizedBox(height: screenHeight * 0.015),
                              Text(
                                timerText,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenHeight * 0.017,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.015),
                              ElevatedButton(
                                onPressed: (){
                                  _cancelTimer();
                                  setState((){
                                    _isVerificationVisible = false;
                                  }); //데이터 전송 + 인증 완료 후 이게 작동되어야 함
                                },
                                child: Text('확인'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(screenWidth*0.18, screenHeight*0.045),
                                  textStyle: TextStyle(fontSize:screenHeight*0.017, fontWeight:FontWeight.w700),
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
                    ),
                  SizedBox(height: screenHeight*0.033),
                  Text(
                    '비밀번호',
                    style: TextStyle(
                      fontSize: screenHeight*0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children:[
                      Expanded(
                          child: Container(
                            height: screenHeight*0.043,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: '비밀번호 (대문자 포함 8~16글자)',
                                hintStyle: TextStyle(fontSize:screenHeight*0.017),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF4B2FFE)),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: screenHeight*0.033),
                  Text(
                    '비밀번호 확인',
                    style: TextStyle(
                      fontSize: screenHeight*0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children:[
                      Expanded(
                        child: Container(
                          height: screenHeight*0.043,
                          child: TextField(
                            controller: _checkController,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                // Add code to update the UI based on password confirmation
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '비밀번호 재입력',
                              hintStyle: TextStyle(fontSize:screenHeight*0.017),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF4B2FFE)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      isPasswordValid(_passwordController.text) &&
                          _checkController.text.isNotEmpty &&
                          _passwordController.text == _checkController.text
                          ? Text('일치 ✓', style: TextStyle(color: Color(0xFF4B2FFE), fontSize:screenHeight*0.017))
                          : (_checkController.text.isNotEmpty
                          ? Text('불일치 X', style: TextStyle(color: Colors.red, fontSize:screenHeight*0.017))
                          : Text('')),

                    ],
                  ),
                  SizedBox(height: screenHeight*0.033),
                  Text(
                    '이름',
                    style: TextStyle(
                      fontSize: screenHeight*0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children:[
                      Expanded(
                        child: Container(
                          height: screenHeight*0.043,
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: '다른 사람들에게는 공개되지 않아!',
                              hintStyle: TextStyle(fontSize:screenHeight*0.017),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF4B2FFE)),
                              ),
                            ),
                            style: TextStyle(fontSize:screenHeight*0.02),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight*0.033),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          if (isConfirmationButtonEnabled) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UI9()),
                            );
                          }
                        },  //다음 페이지로
                        child: Text('확인'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth*0.85, screenHeight*0.045),
                          backgroundColor: isConfirmationButtonEnabled //왜 안될까...
                              ? Color(0xFF4B2FFE)  // 활성화되었을 때 파란색
                              : Color(0xFFE5E5E5),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeInput(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: screenHeight*0.02,
              height: screenHeight*0.045,
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
                    borderSide: BorderSide(color: Color(0xFF4B2FFE)),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}