import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ui7.dart';

class UI6 extends StatefulWidget {
  const UI6({super.key});

  @override
  State<UI6> createState() => _UI6State();
}

class _UI6State extends State<UI6> {
  bool showAlternateTab = false;

  final formKey = GlobalKey<FormState>();
  TextStyle _textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

  void toggleTab1() {
    setState(() {
      showAlternateTab = !showAlternateTab;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _changeTextStyle() {
    setState(() {
      _textStyle = TextStyle(
          fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xff4B2FFE));
    });
  }

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double targetAspectRatio = 9 / 16;

    double containerWidth = screenWidth;
    double containerHeight = screenWidth / targetAspectRatio;


    if (containerHeight > screenHeight) {
      containerHeight = screenHeight;
      containerWidth = screenHeight * targetAspectRatio;
    }

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
                'My 잇',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white70,
            actions: [
              IconButton(
                onPressed: () {},
                iconSize: 40,
                color: Colors.black38,
                icon: const Icon(Icons.person_outline),
              )
            ],
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
              child: Image.asset('assets/images/appIcon.png'),
            ),
          ),
          body: Form(
            key: formKey,
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFEC200),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.28,
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),

                    child: Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.06, screenHeight*0.03, screenWidth*0.06, 0),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                  '23 · ISTJ',
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.w900),
                                  ),
                                ]
                              ),
                              //const Spacer(),
                              Divider(
                                color:Colors.black,
                                  height:screenHeight*0.05),
                             Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            //margin 으로 바뀌고 textformfield로 바꿔야함
                                            "💟 감정을 잘 챙길 줄 알고 섬세한 사람\n👀 운동 잘하고 키 크면 더 좋아!",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.8,
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                              const Spacer(),
                              Container(
                                margin: EdgeInsets.only(bottom: screenHeight*0.0125),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => UI7()),
                                    );
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFE0E0E0), // 버튼 배경색
                                    foregroundColor: Color(0xFF7D7D7D), // 텍스트 색상
                                    elevation: 0, // 그림자 크기
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.03,
                                        vertical: screenHeight * 0.01),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  child: Text(
                                    "뒷면 보기",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.4,
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                /*Image.asset(
                                      'images/flipscore.png',
                                      width: screenWidth * 0.3,
                                      height: screenHeight * 0.07,
                                    ),*/
                                  Text(
                                    'Flip Score: ',
                                    style: TextStyle(
                                      color: Color(0xFFFF5EFF),
                                      fontSize: screenWidth * 0.0395,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  Text(
                                    '33회', //서버 데이터
                                    style: TextStyle(
                                      color: Color(0xFFFF5EFF),
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.0023),
                              ContainerSlider(),
                            //ContainerSlider(),
                          ]
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              child: Container(
                  height: screenHeight * 0.08,
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.home),
                        const Icon(Icons.layers),
                      ]
                  )
              )
          ),
        )
    );
  }
}

class ContainerSlider extends StatefulWidget {
  @override
  _ContainerSliderState createState() => _ContainerSliderState();
}

class _ContainerSliderState extends State<ContainerSlider> {
  int _currentCarousel = 0; //default
  bool isSelectedCarousel1 = false;
  bool isSelectedCarousel2 = false;

  @override
  void initState() {
    super.initState();

    // Perform the initial setup when the widget is first created
    isSelectedCarousel1 = _currentCarousel == 0;
    isSelectedCarousel2 = _currentCarousel == 1;
  }

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double targetAspectRatio = 9 / 16;

    double containerWidth = screenWidth;
    double containerHeight = screenWidth / targetAspectRatio;

    List<Widget> containerList1 = [
      // 뒷면 보기 버튼 없이 포스트잇 아무데나 누르면 뒷면이 뜨도록?
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.3,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · ENFJ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5EFF),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 ㄴㄴ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.2,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · INFJ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5EFF),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 눈누",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.2,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · INTP',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5EFF),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 난나",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.2,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · ENTJ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5EFF),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 나나나",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
    ];
    List<Widget> containerList2 = [
      // 뒷면 보기 버튼 없이 포스트잇 아무데나 누르면 뒷면이 뜨도록?
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.3,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · ENFJ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 ㄴㄴ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.2,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · INFJ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 눈누",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: containerWidth * 0.75,
        height: containerHeight * 0.2,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · INTP',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 난나",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(
            0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        width: screenWidth * 0.75,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          color: Color(0xffFEC200),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '23 · ENTJ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: screenHeight * 0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "👀 나나나",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ))),
              ]),
        ),
      ),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              //enabled: true,
              onPressed: () {
                setState(() {
                  _currentCarousel = 0;
                  isSelectedCarousel1 = true;
                  isSelectedCarousel2 = false;
                });
              },
              /*style : isSelectedCarousel1
                  ? TextButton.styleFrom(
                textStyle: TextStyle(

                ),
              ) : null,*/
              child: Text(
                '내가 플립한',
                style: TextStyle(
                  color: isSelectedCarousel1
                      ? Color(0xFFFF5EFF)
                      : Colors.black, //덮어쓰지 않게
                  fontSize: screenWidth * 0.032,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Text(
              '|',
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _currentCarousel = 1;
                    isSelectedCarousel1 = false;
                    isSelectedCarousel2 = true;
                  });
                },
                /*style : isSelectedCarousel1
                  ? TextButton.styleFrom(
                textStyle: TextStyle(

                ),
              ) : null,*/
                child: Text(
                  '나를 플립한',
                  style: TextStyle(
                    color:
                        isSelectedCarousel2 ? Color(0xFFFF5EFF) : Colors.black,
                    fontSize: screenWidth * 0.032,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                )),
          ],
        ),
        SizedBox(height: screenHeight * 0.0023),
        _currentCarousel == 0
            ? CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  //aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                ),
                items: containerList1.map((container) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: container,
                  );
                }).toList(),
              )
            : SizedBox.shrink(),
        _currentCarousel == 1
            ? CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  //aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                ),
                items: containerList2.map((container) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: container,
                  );
                }).toList(),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
