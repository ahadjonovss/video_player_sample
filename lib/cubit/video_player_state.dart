part of 'video_player_cubit.dart';

@immutable
class VideoPlayerState extends Equatable {
  int currentVideoIndex;
  Duration maxDuration;
  VideoPlayerController? videoPlayerController;

  VideoPlayerState({
    this.videoPlayerController,
    required this.currentVideoIndex,
    required this.maxDuration,
  });

  copyWith({
    Duration? maxDuration,
    int? currentVideoIndex,
    VideoPlayerController? videoPlayerController,
  }) {
    return VideoPlayerState(
      videoPlayerController: videoPlayerController??this.videoPlayerController,
      currentVideoIndex: currentVideoIndex ?? this.currentVideoIndex,
      maxDuration: maxDuration ?? this.maxDuration,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    videoPlayerController,
        maxDuration,
        currentVideoIndex,

      ];
}
