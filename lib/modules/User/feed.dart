import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/comment.dart';
import 'package:talent/modules/video_widget.dart';
import 'package:talent/shared/component.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body:
          UserLayoutCubit.get(context).videoList.length==0?Column(
            children: [
              Center(child: Text('No videos'),)
            ],
          ):PageView.builder(
              controller: PageController(initialPage: 0,viewportFraction: 1),
              itemCount: UserLayoutCubit.get(context).videoList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)=>Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayerItem(videoUrl: '${UserLayoutCubit.get(context).videoList[index].video}'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('${UserLayoutCubit.get(context).videoList[index].name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
                                Text('${UserLayoutCubit.get(context).videoList[index].text}',style: TextStyle(color: Colors.white,fontSize: 26)),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text('${UserLayoutCubit.get(context).likesVideo[index]}',style: TextStyle(color: Colors.white),),
                                    InkWell(onTap: (){
                                      var idP=UserLayoutCubit.get(context).videoId[index];
                                      UserLayoutCubit.get(context).likePost(idP,'Video');
                                      print(UserLayoutCubit.get(context).likesVideo[index]);
                                    },child: Icon(CupertinoIcons.heart_fill,size: 60,color: Colors.white,)),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text('${UserLayoutCubit.get(context).commentsVideo.length}',style: TextStyle(color: Colors.white),),
                                    InkWell(onTap: (){
                                      // print(UserLayoutCubit.get(context).postId[index]);
                                      var idP=UserLayoutCubit.get(context).videoId[index];
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentUserPage(idP.toString(),'Video')));
                                    },child: Icon(Icons.chat,size: 60,color: Colors.white,)),
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
