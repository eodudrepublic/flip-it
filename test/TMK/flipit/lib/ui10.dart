import 'package:flutter/material.dart';
import 'ui8.dart';
import 'ui3.dart';


class UI10 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,  // 배경색을 검은색으로 설정
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:screenWidth*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/appIcon.png', // 이미지 파일 경로
                      width: screenWidth*0.3, // 이미지의 가로 크기 설정
                      height: screenHeight*0.12, // 이미지의 세로 크기 설정
                    ),
                    SizedBox(width:screenWidth*0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '플립으로 잇다, 플립-잇.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight*0.02,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                            'FLIP-IT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight*0.05,
                              fontWeight:FontWeight.w700,
                            )
                        ),
                        Text(
                            '포스트잇으로 찾는 나의 일상 메이트',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight*0.018,
                            fontWeight: FontWeight.w300,
                          ),

                        ),
                      ]
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.05),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight*0.05,

                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '아이디',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.012),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight*0.05,

                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.012),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UI3()),
                    );
                  },  //다음 페이지로
                  child: Text('로그인'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth*0.8, screenHeight*0.045),
                    backgroundColor: Color(0xFF4B2FFE),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.01
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.012),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UI8()),
                        );
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.017,
                          decoration: TextDecoration.underline, // 밑줄 추가
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenWidth * 0.8, 0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
