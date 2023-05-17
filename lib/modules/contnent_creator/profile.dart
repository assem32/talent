import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/content_creator/cubit/cubit.dart';
import 'package:talent/layout/content_creator/cubit/state.dart';
import 'package:talent/modules/User/video_widget_profile.dart';
import 'package:talent/modules/contnent_creator/cubit/state.dart';
import 'package:talent/modules/login/cubit/cubit.dart';
import 'package:talent/modules/video_widget.dart';
import 'package:video_player/video_player.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LayoutCubit(),
      child: BlocConsumer<LayoutCubit,TalentStates>(
        listener: (context,state){},
        builder: (context,state){
          LayoutCubit.get(context).profilePost(userModel!.uId);
          List userData=LayoutCubit.get(context).userData;
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),radius: 30,),
                      SizedBox(width: 12,),
                      Text('${userModel!.name}')
                    ],
                  ),
                ),
                userData.length==0?Text('No posts'):
                Expanded(
                  child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      childAspectRatio: MediaQuery
                          .of(context)
                          .size
                          .width /
                          (MediaQuery
                              .of(context)
                              .size
                              .height * 0.7),
                      children: List.generate(userData.length, (index) =>
                          VideoPlayerItem1(videoUrl: '${userData[index].video}')
                      )
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
