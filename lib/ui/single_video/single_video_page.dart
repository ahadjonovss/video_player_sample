import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_sample/cubit/video_player_cubit.dart';
import 'package:video_player_sample/ui/single_video/widgets/button.dart';

class SingleVideoPage extends StatefulWidget {
  int index;
  SingleVideoPage({required this.index, Key? key}) : super(key: key);

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
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        if (state.videoPlayerController != null) {
          _controller = state.videoPlayerController!;
          return Scaffold(
              body: Stack(
            children: [
              SafeArea(
                child: GestureDetector(
                  onTap: () {
                      context.read<VideoPlayerCubit>().showBar();
                  },
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Visibility(
                visible: context.read<VideoPlayerCubit>().state.isBarShowed!,
                child: Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      state.currentVideoIndex!=1?CustomButton(
                        icon: Icons.skip_previous,
                        action: () {
                          context.read<VideoPlayerCubit>().skipVideo((--state.currentVideoIndex)%3);

                        },
                      ):SizedBox(),
                      CustomButton(
                          icon: state.status == VideoStatus.PLAYING
                              ? Icons.pause
                              : Icons.play_arrow,
                          action: () {
                            context.read<VideoPlayerCubit>().playVideo();
                          },
                          isPlay: true),
                      CustomButton(
                        icon: Icons.skip_next,
                        action: () {
                          context.read<VideoPlayerCubit>().skipVideo((++state.currentVideoIndex)%3);
                        },
                      ),
                    ],
                  ),
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
                            children: [
                              Text(
                                  "${value.position.inMinutes}:${value.position.inSeconds%60} / "),
                              Text(
                                  "${state.maxDuration.inMinutes}:${state.maxDuration.inSeconds%60}"),
                            ],
                          );
                        },
                      ),
                      VideoProgressIndicator(state.videoPlayerController!, allowScrubbing: true),
                    ],
                  ),
                ),
              )
            ],
          ));
        } else {
          return Container();
        }
      },
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
