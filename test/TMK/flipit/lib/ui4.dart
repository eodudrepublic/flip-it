import 'dart:ui';

import 'package:flutter/material.dart';
class  UI4 extends StatefulWidget {
  const  UI4({super.key});

  @override
  State<UI4> createState() => _UI4State();
}
class _UI4State extends State<UI4> {
  final formKey = GlobalKey<FormState>();
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  final List<Tab> myTabs = <Tab>[
    Tab(text: '내가 플립한'),
    Tab(text: '나를 플립한'),
  ];

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
    double fontScaleFactor = screenWidth / containerWidth;

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
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFEC200),
                      borderRadius: BorderRadius.circular(60.0),
                   ),
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.4,
                    margin: EdgeInsets.symmetric(vertical:15.0),
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    child: Padding(
                      padding:  EdgeInsets.all(30.0),
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
                                    fontSize: 28 * fontScaleFactor,
                                    fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
                                padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                                width: containerWidth * 0.75,
                                height: containerHeight * 0.11,
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
                                        "👀 영화 몰아보는 거 좋아하고 의사 표현을 지혜롭게 하는 사람",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16 * fontScaleFactor,
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

                                  },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 7.0),
                                      padding: EdgeInsets.all(5.0),
                                      width: screenWidth * 0.2,
                                      height: screenHeight * 0.05,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E0E0),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text( //margin 으로 바뀌고 textformfield로 바꿔야함
                                                "뒷면 보기",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12 * fontScaleFactor,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.8,
                                                ),
                                              ),
                                            ],
                                          )
                                      )
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
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.42,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 5.0),
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
                                      '플립 스코어: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18 * fontScaleFactor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    Text(
                                      '33 회', //서버 데이터
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18 * fontScaleFactor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )
                                  ]
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    TextButton(
                                      onPressed: (){
                                        _changeTextStyle();
                                      },
                                      child: Text(
                                        '내가 플립한',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16 * fontScaleFactor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      '|',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16 * fontScaleFactor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                        TextButton(
                                        onPressed: (){
                                          _changeTextStyle();
                                        },
                                        child: Text(
                                          '나를 플립한',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16 * fontScaleFactor,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.8,
                                          ),
                                        )
                                    )
                                  ],
                                ),
                                Container(
                                  //alignment: Alignment.centerRight,
                                    margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
                                    padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
                                    width: containerWidth * 0.75,
                                    height: containerHeight * 0.225,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                          ],
                                        )
                                    )
                                ),
                              ]
                          )
                      )
                    )
                  )
              ],
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
        )
    );
  }
}