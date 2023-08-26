import 'dart:ui';

import 'package:flutter/material.dart';
class  UI4 extends StatelessWidget {
  const  UI4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

          appBar:AppBar(
            backgroundColor: Colors.white70,
            actions: [
              IconButton(
                onPressed: () {},
                iconSize: 40,
                color: Colors.black38,
                icon: Icon(Icons.account_circle),
              )
            ],
            leading: Icon(
                size: 40,
                color: Color(0xffFF5EFF),
                Icons.style), //2안 - Icons.photo_filter
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xffFEC200),
              borderRadius: BorderRadius.circular(45.51),
            ),
            width: 275.16, height: 192.94,
            margin: EdgeInsets.fromLTRB(42, 17, 0, 0),
            padding: EdgeInsets.fromLTRB(33.85, 33.85, 26, 10),
            child: Text(
                '테콮',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
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