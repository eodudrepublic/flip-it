import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UI5 extends StatefulWidget {
  const UI5({super.key});

  @override
  State<UI5> createState() => _UI5State();
}
class _UI5State extends State<UI5> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double targetAspectRatio = 9/16;


    double containerWidth = screenWidth;
    double containerHeight = screenWidth/targetAspectRatio;

    if (containerHeight > screenHeight) {
      containerHeight = screenHeight;
      containerWidth = screenHeight * targetAspectRatio;
    }
    return Scaffold(
        backgroundColor: Colors.white,
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
          child:Center(
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFEC200),
                      borderRadius: BorderRadius.circular(60.0)
                    ),
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.85,
                    margin: EdgeInsets.symmetric(vertical:15.0),
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              child: Text(
                                '164cm',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.08,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                )
                              )
                            )
                          ]
                        ),
                      ),
                    ),
                )]
            )
          )

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

void main(){
  runApp(
    MaterialApp(
      home
    )
  )
}