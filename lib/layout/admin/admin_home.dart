import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/admin/cubit/cubit.dart';
import 'package:talent/layout/admin/cubit/state.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AdminLayoutCubit()..getUsers()..getVideos(),
      child: BlocConsumer<AdminLayoutCubit,AdminStates>(
        listener: (context,state){},
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              body: AdminLayoutCubit.get(context).pagesAdmin[AdminLayoutCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: AdminLayoutCubit.get(context).currentIndex,
                onTap: (index){
                  AdminLayoutCubit.get(context).changeIndex(index);
                },
                items: [

                  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Posts'),
                  BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Users'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
