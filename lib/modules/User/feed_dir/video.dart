import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/comment.dart';
import 'package:talent/modules/User/profile/inner_video.dart';
import 'package:talent/shared/component.dart';

class VideoHome extends StatelessWidget {
  const VideoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        // UserLayoutCubit.get(context).getVideos();
        return Scaffold(
          body: UserLayoutCubit.get(context).videoList.length==0?Column(
            children: [
              Text('No Video')
            ],
          ):Column(
            children: [
              Expanded(
                child: ListView.separated(itemBuilder: (context,index) {
                  // var id =UserLayoutCubit.get(context).videoList[index];
                 return InkWell(
                     child: buildPostProfileVideo(model: UserLayoutCubit.get(context).videoList[index],function: (){
                       var comment=UserLayoutCubit.get(context).videoId[index];
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentUserPage(comment,'Video')));
                     },
                     like: UserLayoutCubit.get(context).likesVideo[index],
                       likeFun: (){
                         var id=UserLayoutCubit.get(context).videoId[index];
                         UserLayoutCubit.get(context).likePost(id.toString(), 'Video');
                       }),
                   onTap: (){
                     var videoUrl=UserLayoutCubit.get(context).videoList[index].video;
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>InnerVider(videoUrl: videoUrl)));
                   },
                 );
                }
                    , separatorBuilder: (context,index)=>SizedBox(height: 12,), itemCount: UserLayoutCubit.get(context).videoList.length),
              )
            ],
          ),
        );
      },
    );
  }
}
