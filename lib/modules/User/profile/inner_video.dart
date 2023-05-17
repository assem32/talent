import 'package:flutter/material.dart';
import 'package:talent/modules/video_widget.dart';

class InnerVider extends StatelessWidget {
  const InnerVider({this.videoUrl}) ;
  final videoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child:VideoPlayerItem(videoUrl: videoUrl),
          )
        ],
      ),
    );
  }
}
