import 'package:flutter/material.dart';

class PhotoSetting extends StatefulWidget {
  const PhotoSetting({Key? key}) : super(key: key);

  @override
  State<PhotoSetting> createState() => _PhotoSettingState();
}

class _PhotoSettingState extends State<PhotoSetting> {
  double photoOrder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            PhotoShow(photoOrder: photoOrder.toInt()),
            Slider(
                value: photoOrder,
                max: 2,
                min: 0,
                onChanged: (double val) {
                  setState(() {
                    photoOrder = val;
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoShow extends StatelessWidget {
  final int photoOrder ;

  const PhotoShow({
    required this.photoOrder, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: photoOrder.toString().split('').map((x) => Image.asset('assets/$x.jpeg'))
      .toList(),
    );
  }
}
