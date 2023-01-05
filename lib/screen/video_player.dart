import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer1 extends StatefulWidget {
  final XFile video;

  const VideoPlayer1({required this.video, Key? key}) : super(key: key);

  @override
  State<VideoPlayer1> createState() => _VideoPlayer1State();
}

class _VideoPlayer1State extends State<VideoPlayer1> {
  VideoPlayerController? videoPlayerControler;

  @override
  void initState() {
    super.initState();
    initializeControler();
  }

  initializeControler() async {
    videoPlayerControler = VideoPlayerController.file(File(widget.video.path));
    await videoPlayerControler!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if(videoPlayerControler == null){
      return CircularProgressIndicator();
    }
    return AspectRatio(
      aspectRatio: videoPlayerControler!.value.aspectRatio,
      child: VideoPlayer(
          videoPlayerControler!),
    );
  }
}
