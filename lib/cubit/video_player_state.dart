part of 'video_player_cubit.dart';

@immutable
class VideoPlayerState extends Equatable {
  int currentVideoIndex;
  Duration maxDuration;
  VideoPlayerController? videoPlayerController;
  VideoStatus? status;
  bool? isBarShowed;

  VideoPlayerState({
    this.isBarShowed=false,
    required this.status,
    this.videoPlayerController,
    required this.currentVideoIndex,
    required this.maxDuration,
  });

  copyWith({
    bool? isBarShowed,
    Duration? maxDuration,
    int? currentVideoIndex,
    VideoPlayerController? videoPlayerController,
    VideoStatus? status
  }) {
    return VideoPlayerState(
      isBarShowed: isBarShowed??this.isBarShowed,
      status: status??this.status,
      videoPlayerController: videoPlayerController??this.videoPlayerController,
      currentVideoIndex: currentVideoIndex ?? this.currentVideoIndex,
      maxDuration: maxDuration ?? this.maxDuration,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    isBarShowed,
    videoPlayerController,
        maxDuration,
        currentVideoIndex,
    status

      ];
}

enum VideoStatus{
  PLAYING,
  PAUSED,
  PURE
}
