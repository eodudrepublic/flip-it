import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'ui8.dart';


class UI11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Agreement(),
    );
  }
}


class Agreement extends StatefulWidget {
  const Agreement({super.key});

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool isAgreed = false;
  bool isAgreed1 = false;
  bool isAgreed2 = false;
  bool isAgreed3 = false;
  bool isAgreed4 = false;
  bool isAgreed5 = false;
  bool isAgreed6 = false;
  bool _isTermsVisible1 = true;
  bool _isTermsVisible2 = true;
  bool _isTermsVisible3 = true;

  Future<String> loadTerms1() async {
    return await rootBundle.loadString('assets/terms/service.txt');
  }
  Future<String> loadTerms2() async {
    return await rootBundle.loadString('assets/terms/privacy1.txt');
  }
  Future<String> loadTerms3() async {
    return await rootBundle.loadString('assets/terms/privacy2.txt');
  }

  bool get isNextButtonEnabled{
    return isAgreed1 && isAgreed2 && isAgreed3 && isAgreed5 && isAgreed6;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.028, vertical:screenHeight*0.001),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '약관 동의',
                  style: TextStyle(
                    fontSize: screenHeight*0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02, vertical:screenHeight*0.0015),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical:screenHeight*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: isAgreed,
                            onChanged:(bool? value) {
                              setState(() {
                                isAgreed = value ?? false;
                                isAgreed1 = value ?? false;
                                isAgreed2 = value ?? false;
                                isAgreed3 = value ?? false;
                                isAgreed4 = value ?? false;
                                _isTermsVisible1 = !isAgreed1;
                                _isTermsVisible2 = !isAgreed2;
                                _isTermsVisible3 = !isAgreed3;

                              });
                            },
                        ),
                        Text(
                          '아래 약관에 모두 동의합니다.',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: screenWidth*0.0005),
                    //서비스이용약관 동의
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed1,
                          onChanged:(bool? value) {
                            setState(() {
                              isAgreed1 = value ?? false;
                              _isTermsVisible1 = !isAgreed1;
                            });
                          },
                        ),
                        Text(
                          '서비스이용약관 동의 (필수)',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: _isTermsVisible1 ? Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.3,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth*0.02),
                            child: SingleChildScrollView(
                              child: FutureBuilder(
                                future: loadTerms1(), // Call the loadTextFile function
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // Show loading indicator while reading the file
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Text(
                                        snapshot.data ?? '', // Display the content of the text file
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        )
                          : SizedBox(),
                    ),

                    //개인정보 수집 및 이용 동의
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed2,
                          onChanged:(bool? value) {
                            setState(() {
                              isAgreed2 = value ?? false;
                              _isTermsVisible2 = !isAgreed2;
                            });
                          },
                        ),
                        Text(
                          '개인정보 수집 및 이용 동의 (필수)',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: _isTermsVisible2 ? Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth*0.02),
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: loadTerms2(), // Call the loadTextFile function
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator(); // Show loading indicator while reading the file
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Text(
                                      snapshot.data ?? '', // Display the content of the text file
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      )
                      : SizedBox(),
                    ),

                    //개인정보 취급 위탁 동의
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed3,
                          onChanged:(bool? value) {
                            setState(() {
                              isAgreed3 = value ?? false;
                              _isTermsVisible3 = !isAgreed3;
                            });
                          },
                        ),
                        Text(
                          '개인정보 취급 위탁 동의 (필수)',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: _isTermsVisible3 ? Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth*0.02),
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: loadTerms3(), // Call the loadTextFile function
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator(); // Show loading indicator while reading the file
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Text(
                                      snapshot.data ?? '', // Display the content of the text file
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      )
                      : SizedBox(),
                    ),

                    //광고성 정보 수신 동의
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed4,
                          onChanged:(bool? value) {
                            setState(() {
                              isAgreed4 = value ?? false;
                            });
                          },
                        ),
                        Text(
                          '광고성 정보 수신 동의 (선택)',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    //본인 명의를 이용하여 가입을 진행하겠습니다.
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed5,
                          onChanged:(bool? value) {
                            setState(() {
                              isAgreed5 = value ?? false;
                            });
                          },
                        ),
                        Text(
                          '본인 명의를 이용하여 가입을 진행하겠습니다.',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: screenWidth * 0.8,
                        height: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth*0.02),
                          child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Text(
                                      '부모님, 친구 등 타인의 명의로 가입할 수 없습니다.',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                        ),
                      ),

                    ),

                    //만 14세 이상입니다.
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed6,
                          onChanged:(bool? value) {
                            setState(() {
                              isAgreed6 = value ?? false;
                            });
                          },
                        ),
                        Text(
                          '만 14세 이상입니다.',
                          style: TextStyle(
                            fontSize: screenWidth*0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: screenWidth * 0.8,
                        height: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          color: Color(0xFFEBEBEB),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth*0.02),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Text(
                              '플립-잇은 국내 대학생을 위한 서비스이며, 본인 인증을 통해 만 14세 이상만 가입할 수 있습니다. ',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height:screenHeight*0.01),
                    ElevatedButton(
                      onPressed: (){
                        if(isNextButtonEnabled){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UI8()),
                          );
                        }
                      },
                      child: Text('다음'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenWidth*0.85, screenHeight*0.045),
                        backgroundColor: isNextButtonEnabled
                          ? Color(0xFF4B2FFE) : Color(0xFFE5E5E5),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                            vertical: screenHeight * 0.01),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}