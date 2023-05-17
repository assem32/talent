import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value){
                    UserLayoutCubit.get(context).userSearch(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Search')
                  ),
                ),
                SizedBox(height: 16,),
                UserLayoutCubit.get(context).searchList==0?Column(
                  children: [

                  ],
                ):
                Expanded(child: ListView.separated(itemBuilder: (context,index)=>
                    Container(
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

                      child: Row(
                        children: [
                          CircleAvatar(backgroundImage: NetworkImage('https://img.freepik.com/free-vector/business-persons-hot-air-balloon-searching-employees-happy-creative-people-finding-work-vacancy-flat-vector-illustration-hiring-job-search-hunting-concept-banner-landing-web-page_74855-22965.jpg?w=740&t=st=1683923213~exp=1683923813~hmac=b617e07b9c14a4c8d7b1915dc65d1b564ba9d100c8c49987fb11de5619e71a3d'),radius: 30,),
                          SizedBox(width: 12,),
                          Text('${UserLayoutCubit.get(context).searchList[index].name}'),
                        ],
                      ),
                    ), separatorBuilder: (context,index)=>SizedBox(height: 16,), itemCount: UserLayoutCubit.get(context).searchList.length))
              ],
            ),
          ),
        );
      },
    );
  }
}
