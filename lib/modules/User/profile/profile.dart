import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/profile/image.dart';
import 'package:talent/modules/User/profile/mp3.dart';
import 'package:talent/modules/User/profile/video.dart';
import 'package:talent/modules/login/cubit/cubit.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
        listener: (context,state){},
        builder: (context,state){
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(

                          backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),
                          radius: 36,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name:${userModel!.name}'),
                            Text('Mail:${userModel!.mail}'),
                            Text('Phone:${userModel!.phone}'),
                          ],
                        ),
                        Spacer(),
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(26),
                          child: MaterialButton(
                            onPressed: (){
                              UserLayoutCubit.get(context).userSignOut(context);
                            },
                            child: Text(
                                'Sign out',style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                      ImagesProfileUser(),
                      VideoProfileUser(),
                      AudioPlayerList()
                    ]),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
