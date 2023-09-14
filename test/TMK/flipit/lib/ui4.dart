import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ui5.dart';

class  UI4 extends StatefulWidget {
  const  UI4({super.key});

  @override
  State<UI4> createState() => _UI4State();
}
class _UI4State extends State<UI4> {
  bool showAlternateTab = false;

  final formKey = GlobalKey<FormState>();
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

  void toggleTab1() {
    setState(() {
      showAlternateTab = !showAlternateTab;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _changeTextStyle(){
    setState((){
      _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xff4B2FFE));
    });
  }

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double targetAspectRatio = 9/16;


    double containerWidth = screenWidth;
    double containerHeight = screenWidth/ targetAspectRatio;
    //double fontScaleFactor = screenWidth / containerWidth;

    if (containerHeight > screenHeight) {
      containerHeight = screenHeight;
      containerWidth = screenHeight * targetAspectRatio;
    }
    /*
    if (screenHeight > screenWidth){
      fontScaleFactor = screenHeight * targetAspectRatio;
    }*/

    //final TextStyle testStyle = TextStyle(fontSize: 16 * fontScaleFactor);

    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            title: Text(
                'My 잇',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
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
              child: Image.asset('images/appIcon1.png'),
            ), //2안 - Icons.photo_filter
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
                    height: screenHeight * 0.3,
                    margin: EdgeInsets.symmetric(vertical:screenHeight * 0.02),
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                '23 · ENTP',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0.0, screenHeight*0.023, 0.0, screenHeight*0.018),
                                padding: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 5.0),
                                width: containerWidth * 0.9,
                                height: containerHeight * 0.12,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF5EFF),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( //margin 으로 바뀌고 textformfield로 바꿔야함
                                        "👀 영화 몰아보는 거 좋아하고 의사 표현을 지혜롭게 하는 사람",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth*0.03,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8,
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => UI5()),
                                  );
                                  },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(screenWidth*0.04, screenHeight*0.008),
                                  backgroundColor: Color(0xFFE0E0E0), // 버튼 배경색
                                  foregroundColor: Color(0xFF7D7D7D), // 텍스트 색상
                                  elevation: 0, // 그림자 크기
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth*0.03, vertical: screenHeight*0.01), // 내부 여백
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),// 버튼 모서리 둥글기
                                  ),
                                ),
                                child: Text(
                                  "뒷면 보기",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.025,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
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
                    height: screenHeight * 0.37,
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
                                SizedBox(height:screenHeight*0.0023),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    TextButton(
                                      //enabled: true,
                                      onPressed: (){
                                        _changeTextStyle();
                                        toggleTab1();
                                      },
                                      child: Text(
                                        '내가 플립한',
                                        style: TextStyle(
                                          color: Colors.black,
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
                                        onPressed: (){
                                          _changeTextStyle();
                                          setState(() {
                                            //updateContainerList();
                                          });
                                        },
                                        child: Text(
                                          '나를 플립한',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.032,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.8,
                                        ),
                                        )
                                    ),
                                  ],
                                ),
                                if(showAlternateTab)
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
class ResponsiveButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double targetAspectRatio = 9/16;
    double containerWidth = screenWidth;
    double containerHeight = screenWidth/ targetAspectRatio;

    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth * 0.4;
        double buttonHeight = buttonWidth * 0.3;

        return Container(
          width: buttonWidth,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('버튼'),
          ),
        );
      },
    );
  }
}

class ContainerSlider extends StatefulWidget{
  @override
  _ContainerSliderState createState() => _ContainerSliderState();
}
class _ContainerSliderState extends State<ContainerSlider> {
  @override
  Widget build(BuildContext context){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double targetAspectRatio = 9/16;

    double containerWidth = screenWidth;
    double containerHeight = screenWidth/ targetAspectRatio;

    List<Widget> containerList = [ // 뒷면 보기 버튼 없이 포스트잇 아무데나 누르면 뒷면이 뜨도록?
    Container(
      margin: EdgeInsets.fromLTRB(0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
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
              SizedBox(height:screenHeight*0.002),
              Container(
                  margin: EdgeInsets.symmetric(vertical:screenHeight*0.01),
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
                              fontSize: screenWidth*0.025,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      )
                  )
              ),

            ]
        ),
      ),
    ),
      Container(
        margin: EdgeInsets.fromLTRB(0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
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
                SizedBox(height:screenHeight*0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical:screenHeight*0.01),
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
                                fontSize: screenWidth*0.025,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        )
                    )
                ),

              ]
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
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
                SizedBox(height:screenHeight*0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical:screenHeight*0.01),
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
                                fontSize: screenWidth*0.025,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        )
                    )
                ),

              ]
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0.0, screenHeight * 0.003, 0.0, screenHeight * 0.05),
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
                SizedBox(height:screenHeight*0.002),
                Container(
                    margin: EdgeInsets.symmetric(vertical:screenHeight*0.01),
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
                                fontSize: screenWidth*0.025,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        )
                    )
                ),

              ]
          ),
        ),
      ),
  ];
  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: false,
      //aspectRatio: 16 / 9,
      enlargeCenterPage: true,
    ),
    items: containerList.map((container) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: container,
          );
        },
      );
    }).toList(),
  );

  // 클릭 이벤트에 따라 containerList를 업데이트하는 함수
  void updateContainerList() {
    setState(() {
      // 클릭 이벤트에 따라 새로운 containerList를 만듭니다.
      containerList = [
        // 새로운 상태의 containerList
        // 여기에 새로운 위젯들을 넣어주세요.
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
          width: 210,//containerWidth * 0.75,
          height: 100,//containerHeight * 0.225,
          decoration: BoxDecoration(
            color:  Colors.grey,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text(
                      '23 · INFJ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical:10.0),
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5EFF),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( //margin 으로 바뀌고 textformfield로 바꿔야함
                                "👀 난난나ㅏ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,//screenWidth*0.03,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          )
                      )
                  ),
                ]
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
          width: 210,//containerWidth * 0.75,
          height: 100,//containerHeight * 0.225,
          decoration: BoxDecoration(
            color:  Colors.grey,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text(
                      '23 · INTP',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical:10.0),
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5EFF),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( //margin 으로 바뀌고 textformfield로 바꿔야함
                                "👀 랄라ㅏㄹ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,//screenWidth*0.03,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          )
                      )
                  ),
                ]
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
          width: 210,//containerWidth * 0.75,
          height: 100,//containerHeight * 0.225,
          decoration: BoxDecoration(
            color:  Colors.grey,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text(
                      '24 · ENTJ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical:10.0),
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5EFF),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( //margin 으로 바뀌고 textformfield로 바꿔야함
                                "👀 룰루",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,//screenWidth*0.03,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          )
                      )
                  ),
                ]
            ),
          ),
        ),

      ];
    });
  }
  }

}

