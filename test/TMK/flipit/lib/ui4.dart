import 'dart:ui';

import 'package:flutter/material.dart';
class  UI4 extends StatelessWidget {
  const  UI4({super.key});

  @override
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
    if (screenHeight > screenWidth){
      fontScaleFactor = screenHeight / containerHeight;
    }

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
                icon: Icon(Icons.account_circle),
              )
            ],
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
              child: Image.asset('images/appIcon1.png'),
            ), //2안 - Icons.photo_filter
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFEC200),
                borderRadius: BorderRadius.circular(60.0),
              ),
              width: containerWidth * 0.85,
              height: containerHeight * 0.4,
              margin: EdgeInsets.fromLTRB(0, 29, 0, 0),
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
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                          width: 340.0,
                          height: 100.0,
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
                        Container(

                          margin: EdgeInsets.symmetric(vertical: 7.0),
                            padding: EdgeInsets.all(5.0),
                            width: containerWidth * 0.2,
                            height: containerHeight * 0.05,
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
                                        fontSize: 10 * fontScaleFactor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                  ],
                                )
                            )
                        )
                      ]
                    ),
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
        )
    );
  }
}