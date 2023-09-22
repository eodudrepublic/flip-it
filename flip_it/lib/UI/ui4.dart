import 'package:flutter/material.dart';

class UI4 extends StatelessWidget {
  const UI4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "텤옾",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 240.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                      child: Text("정보 ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "한 줄 소개",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "모집 시즌 마다 한 줄 소개를 알맞게 바꿔봐!",
                        style: TextStyle(
                          color: Colors.black,
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4B2FFE)),
                    child: const SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Center(
                        child: Text(
                          "수정",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                width: 400.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "잇-코인",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4B2FFE)),
                    child: const SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Center(
                        child: Text(
                          "충전",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                width: 400.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: const Center(
                  child: Text("ⓒ 19800",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
