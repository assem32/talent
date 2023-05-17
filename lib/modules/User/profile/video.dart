import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/profile/inner_video.dart';
import 'package:talent/modules/User/profile/user_comment.dart';
import 'package:talent/shared/component.dart';

class VideoProfileUser extends StatelessWidget {
  const VideoProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: UserLayoutCubit.get(context).userVideo.length==0?Column(
            children: [
              Text('No Video upload a video')
            ],
          ):Column(
            children: [
              Expanded(
                child: ListView.separated(itemBuilder: (context,index)=>
                    InkWell(

                        child: buildPostProfileVideo(model: UserLayoutCubit.get(context).userVideo[index],
                            function: (){
                          var postId =UserLayoutCubit.get(context).userVideoId[index];
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentUserPageProfile(postId.toString(),'Video')));
                            },
                            like:UserLayoutCubit.get(context).likesVideo[index] ),
                      onTap: (){
                          var videoUrl=UserLayoutCubit.get(context).userVideo[index].video;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InnerVider(videoUrl: videoUrl.toString(),)));
                      },
                    ), separatorBuilder: (context,index)=>SizedBox(height: 12,), itemCount: UserLayoutCubit.get(context).userVideo.length),
              )

            ],
          ),
        );
      },
    );
  }
}
