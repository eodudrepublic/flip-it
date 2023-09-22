import 'dart:ui';
import 'package:flutter/material.dart';

class MemoUI extends StatelessWidget {
  const MemoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 각 행에 표시될 아이템 수
            mainAxisSpacing: 20.0, // 수직 간격
            crossAxisSpacing: 20.0, // 수평 간격
            childAspectRatio: 1.5, // 가로:세로 = 1:1
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.transparent, // 이 부분을 추가
                  builder: (BuildContext context) {
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
                          backgroundColor: Colors.yellow[700],
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📏',
                              ),
                              Text(
                                '164cm',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                '체형 보통',
                              ),
                              SizedBox(height: 20,),
                              Text(
                                '🎨\n영화 보고, 감성 카페 가는 거 좋아함.',
                              ),
                              SizedBox(height: 20,),
                              Text(
                                '💗',
                              ),
                              Row(
                                children: [
                                  Text(
                                    '다투고 난 후엔 ',
                                  ),
                                  Text(
                                    '시간 두고 얘기',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '개인 시간은  ',
                                  ),
                                  Text(
                                    '필요로 함',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '자율성은 ',
                                  ),
                                  Text(
                                    '보통',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text(
                                '🚬\n비흡연',
                              ),
                            ],
                          ),
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFF4B2FFE)),
                                  onPressed: (){

                                    showDialog(
                                      context: context,
                                      barrierColor: Colors.transparent, // 이 부분을 추가
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.black.withOpacity(0.8),
                                              content: const Text("500 잇-코인",
                                              style: TextStyle(color: Colors.white),),
                                              actions: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor: const Color(0xFF4B2FFE)),
                                                      onPressed: () => Navigator.pop(context),
                                                      child: const Text(
                                                        'ⓒ 잇-코인으로 열어보기',
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context),
                                                      child: const Text(
                                                        '닫기',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Flip!',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    '닫기',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[700], // 노란색 배경
                  borderRadius: BorderRadius.circular(20.0), // 둥근 테두리
                ),
                child: Center(
                  child: Text('${index + 1}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
