import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/models/comment.dart';
import 'package:intl/intl.dart';

var commentController=TextEditingController();


class CommentUserPageProfile extends StatelessWidget {

  String postId;
  String collection;
  CommentUserPageProfile (this.postId,this.collection) ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>UserLayoutCubit(),
      child: BlocConsumer<UserLayoutCubit,UserStates>(
        listener: (context,state){},
        builder: (context,state){
          UserLayoutCubit.get(context).getCommentsImage(postId,collection);
          List<CommentModel> model=UserLayoutCubit.get(context).getcommentImage;
          return Scaffold(
            appBar: AppBar(
              title: Text('Comments on your post'),
            ),
            body:
            model.length==0?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('No comments'),
                    ),
                  ),
                ],
              ),
            ):
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              children: [
                                Text('${model[index].name}'),
                                Text('${model[index].text}'),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Text('time: ${DateFormat('HH:mm').format(DateTime.parse(model[index].dateTime.toString()))}',style: TextStyle(color: Colors.grey),),
                                  Text('date: ${DateFormat('MM-dd').format(DateTime.parse(model[index].dateTime.toString()))}',style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ), separatorBuilder: (context,index)=>SizedBox(height: 16,), itemCount: model.length))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
