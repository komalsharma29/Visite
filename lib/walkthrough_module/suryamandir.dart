import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
class suryamandir extends StatefulWidget {
  const suryamandir({Key? key}) : super(key: key);

  @override
  _suryamandirState createState() => _suryamandirState();
}

class _suryamandirState extends State<suryamandir> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.asset("assets/surya_mandir_video.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager
      ),
    );
  }
}