part of 'video_player_cubit.dart';

@immutable
class VideoPlayerState extends Equatable {
  int currentVideoIndex;
  Duration maxDuration;
  Duration currentPosition;

  VideoPlayerState({
    required this.currentVideoIndex,
    required this.maxDuration,
    required this.currentPosition,
  });

  copyWith({
    int? currentVideoIndex,
    Duration? maxDuration,
    Duration? currentPosition,
  }) {
    return VideoPlayerState(
      currentVideoIndex: currentVideoIndex ?? this.currentVideoIndex,
      maxDuration: maxDuration ?? this.maxDuration,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentDuration,
        maxDuration,
        currentVideoIndex,
      ];
}
