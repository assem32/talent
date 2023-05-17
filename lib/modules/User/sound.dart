import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/cubit/state.dart';

AudioPlayer audioPlayer=AudioPlayer();
class AudioPlayer1 extends StatelessWidget {

  AudioPlayer audioPlayer=AudioPlayer();
  var name;
  var link;
   AudioPlayer1({required this.audioPlayer,this.name,this.link}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLayoutCubit,UserStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  IconButton(onPressed: ()async{
                    UserLayoutCubit.get(context).changePlaying();
                    if(UserLayoutCubit.get(context).playing==true) {
                          Source URL = UrlSource(
                              link);
                          audioPlayer.play(URL);
                        }
                    else {
                      Source URL = UrlSource(
                      link);
                      audioPlayer.pause();
                    }
        }
                      , icon: UserLayoutCubit.get(context).playing==true?Icon(Icons.pause,color: Colors.white,size: 40,):Icon(Icons.play_arrow,color: Colors.white,size: 40,)
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
