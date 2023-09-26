import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui6.dart';

class UI7 extends StatefulWidget {
  const UI7({super.key});

  @override
  State<UI7> createState() => _UI7State();
}

class _UI7State extends State<UI7> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double targetAspectRatio = screenWidth / screenHeight;

    double containerWidth = screenWidth;
    double containerHeight = screenWidth;

    if (containerHeight > screenHeight) {
      containerHeight = screenHeight;
      containerWidth = screenHeight * targetAspectRatio;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My 잇',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 40,
            color: Colors.black38,
            icon: Icon(Icons.person_outline),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
          child: Image.asset('images/appIcon1.png'),
        ), //2안 - Icons.photo_filter
      ),
      body: Form(
          key: formKey,
          child: Center(
              child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffFEC200),
                  borderRadius: BorderRadius.circular(60.0)),
              width: screenWidth * 0.85,
              height: screenHeight * 0.7,
              margin: EdgeInsets.symmetric(vertical: screenHeight*0.02),
              //padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02, vertical: screenHeight*0.02),
              child: Padding(
                padding: EdgeInsets.fromLTRB(screenWidth*0.09, screenHeight*0.038, screenWidth*0.09, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('📏\n164cm',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.8,
                                  )),
                              Text('체형 보통',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.8,
                                  )),
                              Text('근육 근육',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.8,
                                  )),
                              SizedBox(height: screenHeight*0.03),
                              Text('🎨\n야구랑 바다 보러 가는 거 좋아함.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.8,
                                  )),
                              SizedBox(height: screenHeight*0.03),
                              Row(children: [
                                Text('💗\n다투고 난 후엔 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.8,
                                    )),
                                Text('\n시간 두고 얘기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,//screenHeight * 0.021,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                    ))
                              ]),
                              Row(children: [
                                Text('개인 시간은 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.8,
                                    )),
                                Text('필요로 함',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                    ))
                              ]),
                              Row(children: [
                                Text('자율성은 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 0.8,
                                    )),
                                Text('보통',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                    ))
                              ]),
                              SizedBox(height: screenHeight*0.03),
                              Text('🚬\n비흡연 ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.8,
                                  )),
                            ],
                          )),
                      //SizedBox(height: screenHeight * 0.115),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom:screenHeight*0.036),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UI6()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize:Size(screenWidth*0.15, screenWidth*0.1),
                              backgroundColor: Color(0xFFE0E0E0), // 버튼 배경색
                              foregroundColor: Color(0xFF7D7D7D), // 텍스트 색상
                              elevation: 0, // 그림자 크기
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth*0.01, vertical: screenHeight*0.003), // 내부 여백
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15.0), // 버튼 모서리 둥글기
                              ),
                            ),
                            child: Text(
                              "닫기",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]))),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 66,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.layers),
                  ]))),
    );
  }
}
