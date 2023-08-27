import 'dart:ui';

import 'package:flutter/material.dart';

class UI3 extends StatelessWidget {
  const UI3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
    backgroundColor: Colors.white70,
    actions: [
      IconButton(
        onPressed: () {},
        iconSize: 40,
        color: Colors.black38,
        icon: Icon(Icons.person_outline),)
    ],
    leading: Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
    child: Image.asset('images/appIcon1.png'),
    ), //2안 - Icons.photo_filter
    ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0,29,0,0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "현재 모집 중인 잇-메이트",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent, // 이 부분을 추가
                      builder: (BuildContext context) {
                        return CustomDialog();
                      },
                    );
                  },
                  child: Material(
                    elevation: 30,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      width: 400.0,
                      height: 170.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/heart.png'),
                          fit:BoxFit.cover
                        ),
                        //color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        //child: Icons.navigate_next,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("외롭니.."),
                            Text(
                              "3기 연애!",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text("모집 기간: 9.1 ~ 9.15")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "모집 예정",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 30,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 400.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/dumbbell.png'),
                          fit:BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4기 헬스!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "9.16 ~ 9.30",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 30,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: 400.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/glasses.png'),
                          fit:BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "5기 술!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "10.1 ~ 10.15",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 66,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.layers),
                  ]
              )
          )
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
                (states) {
              if (states.contains(MaterialState.selected)) {
                return Color(0xffFF5EFF); // Change this to your desired color
              }
              return Colors.blue; // Change this to your desired color
            },
          ),
        ),
      ),
      //체크박스 색상 변경
      home: Stack(
        alignment: Alignment.center,
        children: [
          // 흐릿한 배경
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                // color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          // 팝업 내용
          AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // 원하는 모서리 반지름 설정
            ),
            title: Center(
              child: Column(
                children: [
                  Text(
                    '플립-잇 3기',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '<연애!> 에 참가할래?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '플립이 되면 알림을 보낼게',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20), // 간격 추가
                CheckboxListTile( //검정 테두리 -> 하얀 테두리?!
                  title: Text(
                    '동의하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,36.0,16.0),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    '입장하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,16.0),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    '닫기',
                    style: TextStyle(color: Colors.white),

                  ),

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
