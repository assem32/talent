import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/comment.dart';
import 'package:talent/modules/User/sound.dart';

class AudioHome extends StatelessWidget {
  const AudioHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body:UserLayoutCubit.get(context).audioList.length==0?Column(
            children: [
              Text('No Audio')
            ],
          ): Column(
            children: [
              Expanded(child: ListView.separated(itemBuilder: (context,index)=>InkWell(
                onTap: (){
                  var audioUrl=UserLayoutCubit.get(context).audioList[index].video;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AudioPlayer1(audioPlayer: audioPlayer,link: audioUrl.toString(),)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            Text('${UserLayoutCubit.get(context).audioList[index].name}'),
                            IconButton(onPressed: (){
                              var postId=UserLayoutCubit.get(context).audioId[index];
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentUserPage(postId.toString(),'Audio')));
                            }, icon: Icon(Icons.chat))
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('time: ${DateFormat('HH:mm').format(DateTime.parse(UserLayoutCubit.get(context).audioList[index].dateTime.toString()))}',style: TextStyle(color: Colors.grey),),
                            Text('date: ${DateFormat('MM-dd').format(DateTime.parse(UserLayoutCubit.get(context).audioList[index].dateTime.toString()))}',style: TextStyle(color: Colors.grey)),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ), separatorBuilder: (context,index)=>SizedBox(
                height: 12,
              ), itemCount: UserLayoutCubit.get(context).audioList.length))
            ],
          ),
        );
      },
    );
  }
}
