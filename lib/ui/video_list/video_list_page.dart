import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_sample/cubit/video_player_cubit.dart';
import 'package:video_player_sample/ui/single_video/single_video_page.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All videos")),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) =>
            InkWell(
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingleVideoPage(index: ++index),));
              },
                child: ListTile(title: Text("$index - video"))),
      ),
    );
  }
}
