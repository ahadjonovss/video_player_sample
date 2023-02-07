import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SingleVideoPage extends StatefulWidget {
  const SingleVideoPage({Key? key}) : super(key: key);

  @override
  State<SingleVideoPage> createState() => _SingleVideoPageState();
}

class _SingleVideoPageState extends State<SingleVideoPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "1.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Player"),),
      body: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),

        ],
      ),
    );
  }
}
