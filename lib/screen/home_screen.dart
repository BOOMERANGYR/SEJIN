import 'package:flutter/material.dart';
import 'package:marry_project/screen/photo_setting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marry_project/screen/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int mainPhoto = 0;
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _Header(
              mainPhoto: mainPhoto,
              onPressd: () {
                settingOnPressed();
              },
            ),
            _ChoicePhoto(
              mainPhoto: mainPhoto,
              onTap: onPhotoTap,
            ),
          ],
        ),
      ),
    );
  }

  settingOnPressed() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(builder: (BuildContext context) {
        return PhotoSetting(
          photoOrder: mainPhoto,
        );
      }),
    );
    if (result != null) {
      setState(() {
        mainPhoto = result;
      });
    }
  }
  void onPhotoTap() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if(video != null){
      setState(() {
        this.video = video;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => VideoPlayer1(video: video!,))
        );
      });
    }
  }

}

class _Header extends StatelessWidget {
  final int mainPhoto;
  final VoidCallback onPressd;

  const _Header({
    required this.mainPhoto,
    required this.onPressd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressd,
      icon: Icon(Icons.settings),
    );
  }
}

class _ChoicePhoto extends StatelessWidget {
  final int mainPhoto;
  final VoidCallback onTap;

  const _ChoicePhoto({
    required this.mainPhoto,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: mainPhoto
            .toString()
            .split('')
            .map((e) => Image.asset('assets/$e.jpeg'))
            .toList(),
      ),
    );
  }
}
