import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit() : super(VideoPlayerState(maxDuration: Duration(seconds: 0),currentDuration: Duration(seconds: 0),currentVideoIndex: 0));


  late VideoPlayerController videoPlayerController;

  initVideo(int index){
    videoPlayerController = VideoPlayerController.asset("assets/$index.mp4")..initialize();
    emit(state.cop)
  }
}
