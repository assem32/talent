import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/login/cubit/cubit.dart';



class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>UserLayoutCubit()..getVideos()..getUsers()..profileAudio(userModel!.uId)..profileImage(userModel!.uId)..profileVideo(userModel!.uId),
      child: BlocConsumer<UserLayoutCubit,UserStates>(
        listener: (context,state){},
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              body: UserLayoutCubit.get(context).pages[UserLayoutCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: UserLayoutCubit.get(context).currentIndex,
                onTap: (index){
                  UserLayoutCubit.get(context).changeIndex(index);
                },
                items: [

                  BottomNavigationBarItem(

                      icon: Icon(Icons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add Post'),
                  BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
