import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit() : super(VideoPlayerState(maxDuration: const Duration(seconds: 0),currentVideoIndex: 0));
  late VideoPlayerController videoPlayerController;

  initVideo(int index){
    videoPlayerController = VideoPlayerController.asset("assets/$index.mp4")..initialize();
    print('Qara');
    print('Qara');
    print('Qara');
    print('Qara');
    print('Qara');
    print('Qara');
    print(videoPlayerController.value.isInitialized);
    emit(state.copyWith(maxDuration:videoPlayerController.value.duration,videoPlayerController: videoPlayerController));
  }
}
