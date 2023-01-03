import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marry_project/screen/photo_setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> imageOrder = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return PhotoSetting();
                      }
                  ),
                );
              },
              icon: Icon(Icons.settings),
            ),
            ChoicePhoto(),
          ],
        ),
      ),
    );
  }
}

class ChoicePhoto extends StatelessWidget {
  const ChoicePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('assets/1.jpeg'));
  }
}
