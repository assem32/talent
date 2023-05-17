import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/admin/cubit/cubit.dart';
import 'package:talent/modules/User/feed_dir/audio.dart';
import 'package:talent/modules/User/feed_dir/image.dart';
import 'package:talent/modules/User/feed_dir/video.dart';
import 'package:talent/modules/User/profile/image.dart';
import 'package:talent/modules/User/profile/mp3.dart';
import 'package:talent/modules/User/profile/video.dart';
import 'package:talent/modules/admin/admin_home/admin_audio.dart';
import 'package:talent/modules/admin/admin_home/admin_image.dart';
import 'package:talent/modules/admin/admin_home/admin_video.dart';
import 'package:talent/modules/login/cubit/cubit.dart';

class AdminHome1 extends StatelessWidget {
  const AdminHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AdminLayoutCubit()..getVideos()..getImages()..getAudio(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: Column(

              children: [
                SizedBox(
                  height: 12,
                ),
                Material(
                  color: (Colors.blue),
                  child: TabBar(

                      tabs:[
                        Tab(
                          child: Text('Images'),
                        ),Tab(
                          child: Text('Video'),
                        ),Tab(
                          child: Text('Audio'),
                        )
                      ]
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    AdminImage(),
                    AdminVideo(),
                    AdminAudio()
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
