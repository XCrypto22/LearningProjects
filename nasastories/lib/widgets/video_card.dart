import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCard extends StatefulWidget {
  const VideoPlayerCard({super.key});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerCard> {
  late VideoPlayerController _videoController;
  late VideoPlayerController _audioController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _videoController.value.isInitialized
          ? _buildVideoPlayerUI()
          : const CircularProgressIndicator(),
    );
  }

  Widget _buildVideoPlayerUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
        Text(
            '${_videoController.value.position} / ${_videoController.value.duration}'),
        VideoProgressIndicator(_videoController, allowScrubbing: true),
        ElevatedButton.icon(
            onPressed: () => _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play(),
            icon: Icon(_videoController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow),
            label: Text(_videoController.value.isPlaying ? 'Pause' : 'Play'))
      ],
    );
  }
}
