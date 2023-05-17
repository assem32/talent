import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talent/layout/content_creator/cubit/cubit.dart';
import 'package:talent/layout/content_creator/cubit/state.dart';
import 'package:talent/modules/contnent_creator/cubit/state.dart';
import 'package:talent/modules/login/cubit/cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

var cationController=TextEditingController();

class VideoUploadPage extends StatefulWidget {
  @override
  _VideoUploadPageState createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  File ?videoFile;
  var compressedVideo;
  VideoPlayerController ? videoController;

  Future<void> _pickVideo() async {
    final pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      videoFile = File(pickedFile.path);
      videoController = VideoPlayerController.file(videoFile!)
        ..initialize().then((_) {
          setState(() {
            videoController!.play();
          });
        });
    }

  }


  // Future<void> compressVideo() async {
  //   final info = await VideoCompress.compressVideo(
  //     videoFile!.path,
  //     quality: VideoQuality.MediumQuality,
  //     deleteOrigin: false,
  //   );
  //
  //   // Replace the original video file with the compressed one
  //   videoFile = File(info!.path!);
  // }




  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,TalentStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            title: Text('Upload Video'),
          ),
          body: Center(
            child: videoFile != null
                ? SingleChildScrollView(
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  AspectRatio(
                    aspectRatio: videoController!.value.aspectRatio,
                    child: VideoPlayer(videoController!),
                  ),
                  SizedBox(height: 16.0),
                  MaterialButton(
                    child: Text('Upload'),
                    onPressed: () {
                      DateTime now = DateTime.now();
                      LayoutCubit.get(context).uploadVideoPost(dateTime: now.toString(), text: cationController.text, video: videoFile,);

                    },
                  ),
                  TextField(
                    controller: cationController,
                    decoration: InputDecoration(
                      label: Text('Add caption')
                    ),
                  )
              ],
            ),
                )
                : Column(
                  children: [
                    MaterialButton(
              child: Text('Select Video'),
              onPressed: _pickVideo,
            ),
                    TextField(
                      controller: cationController,
                      decoration: InputDecoration(

                          label: Text('Add caption')
                      ),
                    )
                  ],
                ),
          ),
        );
      },
    );
  }

}
