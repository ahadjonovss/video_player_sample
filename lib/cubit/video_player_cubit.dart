import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit() : super(VideoPlayerState(status: VideoStatus.PURE,maxDuration: const Duration(seconds: 0),currentVideoIndex: 0));
  late VideoPlayerController videoPlayerController;

  initVideo(int index){
    videoPlayerController = VideoPlayerController.asset("assets/$index.mp4")..initialize().then((value) {
      emit(state.copyWith(currentVideoIndex:index,maxDuration:videoPlayerController.value.duration,videoPlayerController: videoPlayerController,isBarShowed: false));
      playVideo();
    });
  }

  playVideo(){
    if(state.status==VideoStatus.PLAYING){
      pauseVideo();
    }else{
      videoPlayerController.play();
      showBar();
      emit(state.copyWith(status: VideoStatus.PLAYING));
    }

  }

  pauseVideo(){
    videoPlayerController.pause();
    emit(state.copyWith(status: VideoStatus.PAUSED));
  }

  showBar(){
    emit(state.copyWith(isBarShowed: true));
    Future.delayed(const Duration(seconds: 3)).then((value) {
      emit(state.copyWith(isBarShowed: false));
    });
  }

  skipVideo(int index){
    videoPlayerController.pause();
    emit(state.copyWith(status: VideoStatus.PURE));
    initVideo(index);
  }
}
