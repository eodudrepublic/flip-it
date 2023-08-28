import 'dart:ui';

import 'package:flip_ui/ui4.dart';
import 'package:flutter/material.dart';

class UI3 extends StatelessWidget {
  const UI3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UI4();
                  },
                ),
              );
            },
            iconSize: 40,
            icon: Icon(Icons.person_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
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
                    color: Colors.grey,
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
                    color: Colors.grey,
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
    return Stack(
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
              CheckboxListTile(
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
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '입장하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '닫기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
