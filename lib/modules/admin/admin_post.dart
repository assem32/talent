import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/admin/cubit/cubit.dart';
import 'package:talent/layout/admin/cubit/state.dart';
import 'package:talent/modules/admin/comment_admin.dart';
import 'package:talent/modules/video_widget.dart';

class AdminFeedPage extends StatelessWidget {
  const AdminFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminLayoutCubit,AdminStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: AdminLayoutCubit.get(context).videoAdmin.length==0? Column(
            children: [
              Center(
                child: Text('No vedio'),
              )
            ],
          ):PageView.builder(
              controller: PageController(initialPage: 0,viewportFraction: 1),
              itemCount: AdminLayoutCubit.get(context).videoAdmin.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)=>Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayerItem(videoUrl: '${AdminLayoutCubit.get(context).videoAdmin[index].video}'),
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
                                Text('${AdminLayoutCubit.get(context).videoAdmin[index].name}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
                                Text('${AdminLayoutCubit.get(context).videoAdmin[index].text}',style: TextStyle(color: Colors.white,fontSize: 26)),
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
                                  Text('${AdminLayoutCubit.get(context).likesAdminVideo[index]}',style: TextStyle(color: Colors.white),),
                                    InkWell(onTap: (){},child: Icon(CupertinoIcons.heart_fill,size: 60,color: Colors.white,)),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                InkWell(onTap: (){
                                  var idP=AdminLayoutCubit.get(context).videoAdminId[index];
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentAdminPage(idP.toString())));
                                },child: Icon(Icons.chat,size: 60,color: Colors.white,)),
                                SizedBox(
                                  width: 16,
                                ),
                                InkWell(onTap: (){
                                  var idP=AdminLayoutCubit.get(context).videoAdminId[index];
                                  // AdminLayoutCubit.get(context).deletePost(idP);
                                },child: Icon(Icons.delete,size: 60,color: Colors.white,)),
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
