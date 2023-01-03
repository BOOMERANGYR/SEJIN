import 'package:flutter/material.dart';

class PhotoSetting extends StatefulWidget {
  final int photoOrder;
  const PhotoSetting({
    required this.photoOrder,
    Key? key,
  }) : super(key: key);

  @override
  State<PhotoSetting> createState() => _PhotoSettingState();
}

class _PhotoSettingState extends State<PhotoSetting> {
  double photoOrder = 0;

  @override
  void initState() {
    photoOrder = widget.photoOrder.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PhotoShow(photoOrder: photoOrder.toInt()),
            _Bottom(photoOrder: photoOrder,
              onChanged: photoChangedSilider,)
          ],
        ),
      ),
    );
  }

  photoChangedSilider (double val) {
    setState(() {
      photoOrder = val;
    });
  }
}

class PhotoShow extends StatelessWidget {
  final int photoOrder;

  const PhotoShow({
    required this.photoOrder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: photoOrder
          .toString()
          .split('')
          .map((x) => Image.asset('assets/$x.jpeg'))
          .toList(),
    );
  }
}

class _Bottom extends StatelessWidget {
  final double photoOrder;
  final ValueChanged<double>? onChanged;

  const _Bottom({
    required this.photoOrder,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            value: photoOrder,
            max: 2,
            min: 0,
            onChanged: onChanged,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(photoOrder.toInt());
          },
          child: Text('배경으로 지정'),
        )
      ],
    );
  }
}
