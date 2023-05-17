import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/profile/user_comment.dart';
import 'package:talent/shared/component.dart';

class ImagesProfileUser extends StatelessWidget {
  const ImagesProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: UserLayoutCubit.get(context).userImage.length==0?Column(
              children: [
                Text('No image upload a image')
              ],
            ):Column(
              children: [
                SizedBox(height: 12,),
                Expanded(child: ListView.separated(itemBuilder: (context,index)=>buildPostProfileImage(model: UserLayoutCubit.get(context).userImage[index],
                    function: (){
                  var commentId=UserLayoutCubit.get(context).userImageId[index];
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentUserPageProfile(commentId.toString(),'Images')));
                    },
                  // like: UserLayoutCubit.get(context).likesImage[index].toString()
                )
                    , separatorBuilder: (context,index)=>SizedBox(height: 12,), itemCount: UserLayoutCubit.get(context).userImage.length))
              ],
            ),
          ),
        );
      },

    );
  }
}
