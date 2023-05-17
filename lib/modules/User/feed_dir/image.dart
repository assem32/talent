import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/modules/User/comment.dart';
import 'package:talent/shared/component.dart';

class ImageHome extends StatelessWidget {
  const ImageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: UserLayoutCubit.get(context).imageList.length == 0
              ? Column(
                  children: [Text('No Images')],
                )
              : Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) =>
                                buildPostProfileImage(
                                  model: UserLayoutCubit.get(context)
                                      .imageList[index],
                                  function: () {
                                    var id = UserLayoutCubit.get(context)
                                        .imageId[index];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommentUserPage(
                                                    id.toString(), 'Images')));
                                  },
                                  likeFun: () {
                                    var id = UserLayoutCubit.get(context)
                                        .imageId[index];
                                    UserLayoutCubit.get(context)
                                        .likePost(id.toString(), 'Images');
                                  },
                                  like: UserLayoutCubit.get(context)
                                      .likesImage[index],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 12,
                                ),
                            itemCount:
                                UserLayoutCubit.get(context).imageList.length))
                  ],
                ),
        );
      },
    );
  }
}
