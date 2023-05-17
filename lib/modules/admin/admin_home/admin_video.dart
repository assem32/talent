import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/admin/cubit/cubit.dart';
import 'package:talent/layout/admin/cubit/state.dart';
import 'package:talent/modules/User/profile/inner_video.dart';
import 'package:talent/shared/component.dart';

import '../comment_admin.dart';

class AdminVideo extends StatelessWidget {
  const AdminVideo ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminLayoutCubit,AdminStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(itemBuilder: (context,index)=>
                      InkWell(child: buildPostAdminVideo(model: AdminLayoutCubit.get(context).videoAdmin[index],functionDel: (){
                        AdminLayoutCubit.get(context).deletePost(AdminLayoutCubit.get(context).videoAdminId[index], 'Video', (){
                          AdminLayoutCubit.get(context).videoAdmin.clear();
                        }, (){
                          AdminLayoutCubit.get(context).getVideos();
                        });
                      },function: () {
                        var id= AdminLayoutCubit.get(context).videoAdminId[index];
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                CommentAdminPage(id, 'Video')));
                      },like: AdminLayoutCubit.get(context).likesAdminVideo[index]),

                        onTap: (){
                        var url=AdminLayoutCubit.get(context).videoAdmin[index].video;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InnerVider(videoUrl: url,)));
                        },
                      ),
                      separatorBuilder: (context,index)=>SizedBox(height: 12,),
                      itemCount: AdminLayoutCubit.get(context).videoAdmin.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
