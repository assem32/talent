import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/content_creator/cubit/state.dart';
import 'package:talent/models/post_model.dart';
import 'package:talent/modules/contnent_creator/add_content.dart';

import 'package:talent/modules/contnent_creator/profile.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:talent/modules/login/cubit/cubit.dart';


class LayoutCubit extends Cubit<TalentStates> {
  LayoutCubit() : super(TalentInit());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  void changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexState());
  }

  List <Widget> pages=[
    VideoUploadPage(),
    ProfilePage()
  ];

  void uploadVideoPost({
    required String dateTime,
    required String text,
    required video,
  }){


    firebase_storage.FirebaseStorage.instance.ref().child('path/${Uri.file(video.path).pathSegments.last}').putFile(video)
        .then((value){
      value.ref.getDownloadURL().then((value){
        createPost(dateTime: dateTime, text: text,video: value,);
        profilePost(userModel!.uId);
        emit(UploadVideoFirebaseSuccessState());

      }).catchError((error){});
      emit(UploadVideoFirebaseErrorState());
    }).catchError((error){
      emit(UploadVideoFirebaseErrorState());
    });
  }


  void createPost({
    required String dateTime,
    required String text,
    String ?video,

  }){
    // emit(SocialCreatePostLoadingState());
    PostModel model=PostModel(
      name: userModel?.name,
      uId: userModel?.uId,
      video: video,
      dateTime: dateTime,
      text: text,

    );
    FirebaseFirestore.instance.collection('Video').add(model.toMap())
        .then((value){
      emit(SocialCreatePostSuccessState());
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }


  List<PostModel> userData=[];
  void profilePost(String ?userId){
    FirebaseFirestore.instance
        .collection('Video').orderBy('dateTime').snapshots().listen((event) {
      userData=[];
      event.docs.forEach((element) {
        if(element.data()['uId']==userId)
          userData.add(PostModel.fromJson(element.data()));
      });
      print(userData);
      emit(GetProfileSuccessState());
    });
  }
}