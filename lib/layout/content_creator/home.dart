import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/content_creator/cubit/cubit.dart';
import 'package:talent/layout/content_creator/cubit/state.dart';
import 'package:talent/modules/login/cubit/cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LayoutCubit()..profilePost(userModel?.uId),
      child: BlocConsumer<LayoutCubit,TalentStates>(
        listener: (context,state){},
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              body: LayoutCubit.get(context).pages[LayoutCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: LayoutCubit.get(context).currentIndex,
                onTap: (index){
                  LayoutCubit.get(context).changeIndex(index);
                },
                items: [

                  BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add work'),
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
