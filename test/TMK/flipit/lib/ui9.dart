import 'package:flutter/material.dart';
import 'ui3.dart';


class UI9 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,  // 배경색을 검은색으로 설정
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/appIcon.png', // 이미지 파일 경로
                  width: screenWidth*0.3, // 이미지의 가로 크기 설정
                  height: screenHeight*0.12, // 이미지의 세로 크기 설정
                ),
                SizedBox(height: screenHeight*0.02),
                Text(
                    '플립-잇에 온 걸 환영해!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight*0.035,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                SizedBox(height: screenHeight*0.03),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UI3()),
                    );
                  },  //다음 페이지로
                  child: Text('시작하기'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth*0.8, 0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
