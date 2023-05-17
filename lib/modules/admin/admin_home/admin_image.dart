import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/admin/cubit/cubit.dart';
import 'package:talent/layout/admin/cubit/state.dart';
import 'package:talent/shared/component.dart';

class AdminImage extends StatelessWidget {
  const AdminImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminLayoutCubit, AdminStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => buildPostAdminImage(
                          model: AdminLayoutCubit.get(context).imageAdmin[index],
                          delFun: () {
                            AdminLayoutCubit.get(context).deletePost(
                                AdminLayoutCubit.get(context).imageAdminId[index],
                                'Images', () {
                              AdminLayoutCubit.get(context).imageAdmin.clear();
                            }, () {
                              AdminLayoutCubit.get(context).getImages();
                            });
                          },
                        like: AdminLayoutCubit.get(context).likesAdminImage[index]
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 12,
                          ),
                      itemCount: AdminLayoutCubit.get(context).imageAdmin.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
