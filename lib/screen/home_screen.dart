import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        _Question("우리가 연애를 시작한 날", "같이 갔던 술집 이름은?"),
        _Question("우리가 연애를 시작한", "정확한 날짜는?"),
      ],
    );
  }
}

class _Question extends StatelessWidget {
  String Q;
  String Q_1;

  _Question(this.Q, this.Q_1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/main_photo.jpeg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(Q,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            Text(Q_1,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            decoration:
                                new InputDecoration(hintText: "정답을 입력하세요."),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        fixedSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: () {},
                    child: Text(
                      "다음단계로 이동",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}