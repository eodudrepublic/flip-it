import 'package:dots_indicator/dots_indicator.dart';
//import 'package:flip_it/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final List<Widget> pages = [
  const Detail1(),
  const Detail2(),
  const Detail3(),
  const Detail4(),
  const Detail5(),
  const Detail6()
];

class UI5 extends StatefulWidget {
  const UI5({super.key});

  @override
  State<UI5> createState() => _UI5State();
}

class _UI5State extends State<UI5> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
        print(_currentPage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:screenHeight*0.0001,horizontal:screenWidth*0.01),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: screenHeight*0.127,
                ),
                Text(
                  "<연애!>에 온 걸 환영해!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth*0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "상대가 \"FLIP\"하기 전 포스트잇 뒷면에 공개될 상세 정보야.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth*0.036,
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.025,
                ),
                DotsIndicator(
                  dotsCount: pages.length,
                  //position: _currentPage,
                  decorator: DotsDecorator(
                    activeColor: const Color(0xFF4B2FFE),
                    size: Size.square(screenWidth*0.02),
                    activeSize: Size(screenWidth*0.036, screenWidth*0.02),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.9,
                  child: PageView.custom(
                    controller: _controller,
                    childrenDelegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(16.0, 10, 16.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: pages[index],
                        );
                      },
                      childCount: pages.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.033,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4B2FFE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                      ),
                      child: SizedBox(
                        width: screenWidth*0.25,
                        height: screenWidth*0.14,
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth*0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth*0.02,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        /*if (_currentPage == pages.length-1) {
                          Navigator.pushReplacement(
                            context,
                            /*MaterialPageRoute(
                              builder: (context) {
                                //return ReadTest();
                              },
                            ),*/
                          );
                          Fluttertoast.showToast(
                              msg: "저장되었습니다.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        else {*/
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          //}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4B2FFE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: SizedBox(
                        width: screenWidth*0.25,
                        height: screenWidth*0.14,
                        child: Center(
                          child: Text(
                            _currentPage == pages.length-1 ? "저장" :
                            "다음",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth*0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight*0.015,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x804B2FFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.6,
                    height: screenWidth*0.14,
                    child: Center(
                      child: Text(
                        "임시저장하고 나가기",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth*0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Detail1 extends StatelessWidget {
  const Detail1({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth*0.07),
        child: Column(
          children: [
            SizedBox(
              height: screenWidth*0.036,
            ),
            Text(
              "키",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth*0.077,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      hintText: "164",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth*0.077,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth*0.02,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth*0.077,
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Detail2 extends StatefulWidget {
  const Detail2({super.key});

  @override
  State<Detail2> createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> {
  List<int> selectedBody = [];
  List<int> selectedMuscle = [];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth*0.07),
        child: Column(
          children: [
            SizedBox(
              height: screenWidth*0.036,
            ),
            Text(
              "체형",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth*0.077,
              ),
            ),
            Text(
              "2개까지 선택 가능해!",
              style: TextStyle(
                fontSize: screenWidth*0.036,
              ),
            ),
            SizedBox(
              height: screenWidth*0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customRadio('마름', 0),
                customRadio('보통', 1),
                customRadio('뚠뚠', 2),
              ],
            ),
            Divider( //항목 분리
              height: screenHeight*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customRadio2('근육 적음', 0),
                customRadio2('보통', 1),
                customRadio2('근육질', 2),
              ],
            )
          ],
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      if (selectedBody.contains(index)) {
        selectedBody.remove(index);
        return;
      }

      if (selectedBody.length >= 2) {
        // 이미 두 개가 선택되어 있을 경우 더 이상 선택 불가능
        return;
      }

      if (selectedBody.isNotEmpty) {
        if ((index - selectedBody.first).abs() != 1) {
          // 선택하려는 항목이 이미 선택된 항목과 연속되지 않을 경우 불가능
          return;
        }
      }

      selectedBody.add(index);
      selectedBody.sort(); // 선택된 항목들을 정렬
    });
  }

  Widget customRadio(String txt, int index) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            txt,
            style: TextStyle(
              color: selectedBody.contains(index)
                  ? const Color(0xFF4B2FFE)
                  : Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          RawMaterialButton(
            onPressed: () => changeIndex(index),
            fillColor:
            selectedBody.contains(index) ? const Color(0xFF4B2FFE) : Colors.white,
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }

  void changeIndex2(int index) {
    setState(() {
      if (selectedMuscle.contains(index)) {
        selectedMuscle.remove(index);
        return;
      }

      if (selectedMuscle.length >= 2) {
        // 이미 두 개가 선택되어 있을 경우 더 이상 선택 불가능
        return;
      }

      if (selectedMuscle.isNotEmpty) {
        if ((index - selectedMuscle.first).abs() != 1) {
          // 선택하려는 항목이 이미 선택된 항목과 연속되지 않을 경우 불가능
          return;
        }
      }

      selectedMuscle.add(index);
      selectedMuscle.sort(); // 선택된 항목들을 정렬
    });
  }

  Widget customRadio2(String txt, int index) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            txt,
            style: TextStyle(
              color: selectedMuscle.contains(index)
                  ? const Color(0xFF4B2FFE)
                  : Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          RawMaterialButton(
            onPressed: () => changeIndex2(index),
            fillColor: selectedMuscle.contains(index)
                ? const Color(0xFF4B2FFE)
                : Colors.white,
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}

class Detail3 extends StatelessWidget {
  const Detail3({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth*0.07),
        child: Column(
          children: [
            SizedBox(
              height: screenWidth*0.036,
            ),
            Text(
              "취미",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth*0.077,
              ),
            ),
            SizedBox(
              height: screenWidth*0.07,
            ),
            TextFormField(
              maxLines: 7,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "ex. 운동, 집콕, 야구 보기, 맛집 투어",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Detail4 extends StatefulWidget {
  const Detail4({super.key});

  @override
  State<Detail4> createState() => _Detail4State();
}

class _Detail4State extends State<Detail4> {
  int selected1 = 0;
  int selected2 = 0;
  int selected3 = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth*0.07,screenWidth*0.07,screenWidth*0.07,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "연애 스타일",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth*0.077,
                ),
              ),
            ),
            SizedBox(
              height:screenWidth*0.05,
            ),
            Text(
              "Q. 다투고 난 후?",
              style: TextStyle(
                fontSize: screenWidth*0.036,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customRadio1("그날 바로", 0),
                customRadio1("시간이 약", 1),
                customRadio1("넘어가기", 2),
              ],
            ),
            SizedBox(
              height: screenWidth*0.03,
            ),
            Text(
              "Q. 개인 시간?",
              style: TextStyle(
                fontSize: screenWidth*0.036,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customRadio2("필요 X", 0),
                customRadio2("상관 X", 1),
                customRadio2("필요해", 2),
              ],
            ),
            SizedBox(
              height: screenWidth*0.03,
            ),
            Text(
              "Q. 자율시간?",
              style: TextStyle(
                fontSize: screenWidth*0.036,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customRadio3("구속", 0),
                customRadio3("보통", 1),
                customRadio3("방목", 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changeIndex1(int index) {
    setState(() {
      selected1 = index;
    });
  }

  Widget customRadio1(String txt, int index) {
    return SizedBox(
      child: OutlinedButton(
        onPressed: () => changeIndex1(index),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            side: BorderSide(
                color: selected1 == index ? Color(0xFF4B2FFE) : Colors.black),
            backgroundColor: selected1 == index ? Color(0xFF4B2FFE) : Colors.white),
        child: Text(
          txt,
          style: TextStyle(
            color: selected1 == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void changeIndex2(int index) {
    setState(() {
      selected2 = index;
    });
  }

  Widget customRadio2(String txt, int index) {
    return SizedBox(
      child: OutlinedButton(
        onPressed: () => changeIndex2(index),
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            side: BorderSide(
                color: selected2 == index ? Color(0xFF4B2FFE) : Colors.black),
            backgroundColor: selected2 == index? Color(0xFF4B2FFE) : Colors.white),
        child: Text(
          txt,
          style: TextStyle(
            color: selected2 == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void changeIndex3(int index) {
    setState(() {
      selected3 = index;
    });
  }

  Widget customRadio3(String txt, int index) {
    return SizedBox(
      child: OutlinedButton(
        onPressed: () => changeIndex3(index),
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            side: BorderSide(
                color: selected3 == index ? Color(0xFF4B2FFE) : Colors.black),
            backgroundColor: selected3 == index? Color(0xFF4B2FFE) : Colors.white),
        child: Text(
          txt,
          style: TextStyle(
            color: selected3 == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Detail5 extends StatefulWidget {
  const Detail5({super.key});

  @override
  State<Detail5> createState() => _Detail5State();
}

class _Detail5State extends State<Detail5> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(
              height: screenWidth*0.036,
            ),
            Text(
              "흡연 여부",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth*0.077,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "NO",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth*0.06,
                      ),
                    ),
                    Text(
                      "비흡연",
                      style: TextStyle(
                        fontSize: screenWidth*0.05,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Transform.scale(
                  scale: 2,
                  child: CupertinoSwitch(
                    value: _isChecked,
                    activeColor: const Color(0xFF4B2FFE),
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "YES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth*0.06,
                      ),
                    ),
                    Text(
                      "흡연",
                      style: TextStyle(
                        fontSize: screenWidth*0.05,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Detail6 extends StatelessWidget {
  const Detail6({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(
              height: screenWidth*0.036,
            ),
            Text(
              "연락 방법",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth*0.077,
              ),
            ),
            SizedBox(
              height: screenWidth*0.02,
            ),
            Text(
              "상대가 \"FLIP\" 해야 공개되는 정보야.\n인스타인지 카톡인지 적어둬야 상대방이 알 수 있어!",
              style: TextStyle(
                  fontSize: screenWidth*0.036,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "ex. 인스타: @test_1  카톡: test1234",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
