import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_sample/cubit/video_player_cubit.dart';
import 'package:video_player_sample/ui/single_video/widgets/button.dart';

class SingleVideoPage extends StatefulWidget {
  int index;
   SingleVideoPage({required this.index,Key? key}) : super(key: key);

  @override
  State<SingleVideoPage> createState() => _SingleVideoPageState();
}

class _SingleVideoPageState extends State<SingleVideoPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    context.read<VideoPlayerCubit>().initVideo(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    context.read<VideoPlayerCubit>().initVideo(1);
    final mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<VideoPlayerCubit,VideoPlayerState>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(
              children: [
                if (_controller.value.isInitialized)
                  OrientationBuilder(
                    builder: (context, orientation) {
                      if (mediaQueryData.orientation == Orientation.portrait) {
                        return SafeArea(
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: mediaQueryData.size.height,
                          width: mediaQueryData.size.width,
                          child: VideoPlayer(_controller),
                        );
                      }
                    },
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        icon: Icons.skip_previous,
                        action: () {},
                      ),
                      CustomButton(icon: Icons.play_arrow, action: () {
                        _controller.play();
                      }, isPlay: true),
                      CustomButton(
                        icon: Icons.skip_next,
                        action: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    height: 30,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, VideoPlayerValue value, child) {
                            //Do Something with the value.
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                Text("${value.position.inMinutes}:${value.position.inSeconds} / "),
                                Text("9:05"),
                              ],
                            );
                          },
                        ),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
