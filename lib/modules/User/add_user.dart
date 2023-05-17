import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';

class AddUserTalent extends StatelessWidget {
  const AddUserTalent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(UserLayoutCubit.get(context).imageFile!=null)
                    Container(
                        height: 150, width: double.infinity, child: Image.file( UserLayoutCubit.get(context).imageFile!)
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(26),
                        child: MaterialButton(onPressed: (){
                          UserLayoutCubit.get(context).pickImage();
                        },child: Text('Select image',style: TextStyle(color: Colors.white)),),
                      ),
                      SizedBox(width: 12,),
                      if(UserLayoutCubit.get(context).imageFile!=null)
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(26),
                          child: MaterialButton(onPressed: (){
                            DateTime now = DateTime.now();
                            UserLayoutCubit.get(context).uploadDataPost(dateTime: now.toString(),file: UserLayoutCubit.get(context).imageFile,collection: 'Images');
                          },child: Text('Upload Image',style: TextStyle(color: Colors.white)),),
                        )
                    ],
                  ),
                  if(UserLayoutCubit.get(context).videoFile!=null)
                    AspectRatio(
                      aspectRatio: UserLayoutCubit.get(context).videoController!.value.aspectRatio,
                      child: VideoPlayer(UserLayoutCubit.get(context).videoController!),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(26),
                        child: MaterialButton(onPressed: (){
                          UserLayoutCubit.get(context).pickVideo();
                        },child: Text('Select Video',style: TextStyle(color: Colors.white)),),
                      ),
                      SizedBox(width: 12,),
                      if(UserLayoutCubit.get(context).videoFile!=null)
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(26),
                          child: MaterialButton(onPressed: (){
                            DateTime now = DateTime.now();
                            UserLayoutCubit.get(context).uploadDataPost(dateTime: now.toString(),file: UserLayoutCubit.get(context).videoFile,collection: 'Video');
                          },child: Text('Upload Video',style: TextStyle(color: Colors.white),),),
                        )
                    ],
                  ),

                  if(UserLayoutCubit.get(context).selectedFile!=null)
                    Text('name is: ${UserLayoutCubit.get(context).selectedFile!.path}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(26),
                        child: MaterialButton(onPressed: (){
                          UserLayoutCubit.get(context).pickAudio();
                        },child: Text('Select Audio',style: TextStyle(color: Colors.white)),),
                      ),
                      SizedBox(width: 12,),
                      if(UserLayoutCubit.get(context).selectedFile!=null)
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(26),
                          child: MaterialButton(onPressed: (){
                            DateTime now = DateTime.now();
                            UserLayoutCubit.get(context).uploadDataPost(dateTime: now.toString(),file: UserLayoutCubit.get(context).selectedFile,collection: 'Audio');
                          },child: Text('Upload Audio',style: TextStyle(color: Colors.white)),),
                        )
                    ],
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
