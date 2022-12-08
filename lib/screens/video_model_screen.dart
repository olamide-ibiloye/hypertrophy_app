import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:hypertrophy_app/constants.dart';


class VideoModel extends StatelessWidget {
  const VideoModel({super.key, required this.videoID});

  final String videoID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: BackButton(
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: YoutubePlayer(
                  aspectRatio: 9 / 16,
                  controller: YoutubePlayerController(
                    initialVideoId: videoID,
                    flags: const YoutubePlayerFlags(
                      forceHD: true,
                      hideControls: true,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blue,
                  progressColors: const ProgressBarColors(
                      playedColor: Colors.blue, handleColor: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
