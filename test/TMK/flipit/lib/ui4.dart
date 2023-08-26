import 'dart:ui';

import 'package:flutter/material.dart';
class  UI4 extends StatelessWidget {
  const  UI4({super.key});

  @override
  Widget build(BuildContext context) {
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
          body: Container(
            child: Center(
              child: Material(
                child: Container(
                  width: 360.0,
                  height: 190.0,
                  margin: EdgeInsets.fromLTRB(42, 17, 0, 0),
                  padding: EdgeInsets.fromLTRB(33.85, 33.85, 26, 10),
                  decoration: BoxDecoration(
                    color: Color(0xffFEC200),
                    borderRadius: BorderRadius.circular(45.51),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    //child: Icons.navigate_next,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        '테콮',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900)),
                        Spacer(),
                        Text("모집 기간: 9.1 ~ 9.15")
                      ],
                    ),
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