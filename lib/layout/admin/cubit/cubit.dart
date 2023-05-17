import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/admin/cubit/state.dart';
import 'package:talent/models/comment.dart';
import 'package:talent/models/post_model.dart';
import 'package:talent/models/user_model.dart';
import 'package:talent/modules/admin/admin_home/admin_Home.dart';
import 'package:talent/modules/admin/admin_post.dart';
import 'package:talent/modules/admin/users.dart';

class AdminLayoutCubit extends Cubit<AdminStates> {
  AdminLayoutCubit() : super(AdminInit());

  static AdminLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  void changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexStateA());
  }

  List <Widget> pagesAdmin=[
    AdminHome1(),
    AdminUsers()
  ];

  List<UserModel>usersList=[];

  void getUsers(){
    FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        usersList.add(UserModel.fromJson(element.data()));
      });
      print(usersList);
      emit(AdminGetUsersState());
    }).catchError((error){
      print(error.toString());
    });
  }


  List <PostModel> videoAdmin=[];
  List <String>videoAdminId=[];
  List <int>likesAdminVideo=[];
  void getVideos(){
    FirebaseFirestore.instance.collection('Video').get().then((value) {
      // value.docs.forEach((element) {
      //   element.reference.collection('comments').get().then((value){
      //     comments.add(element.id);
      //   }).catchError(onError);
      // });

      value.docs.forEach((element) {

        element.reference.collection('likes').get().then((value){
          likesAdminVideo.add(value.docs.length);
          videoAdminId.add(element.id);//to get post id
          videoAdmin.add(PostModel.fromJson(element.data()));
          emit(GetUserPostSuccessState());
        }).catchError((error){
        });
        // print(postId);

      });
    });}

  List <PostModel> imageAdmin=[];
  List <String>imageAdminId=[];
  List <int>likesAdminImage=[];
  void getImages(){
    FirebaseFirestore.instance.collection('Images').get().then((value) {
      // value.docs.forEach((element) {
      //   element.reference.collection('comments').get().then((value){
      //     comments.add(element.id);
      //   }).catchError(onError);
      // });

      value.docs.forEach((element) {

        element.reference.collection('likes').get().then((value){
          likesAdminImage.add(value.docs.length);
          imageAdminId.add(element.id);//to get post id
          imageAdmin.add(PostModel.fromJson(element.data()));
          emit(GetUserPostSuccessState());
        }).catchError((error){
        });
        // print(postId);

      });
    });}

  List <PostModel> audioAdmin=[];
  List <String>audioAdminId=[];
  List <int>likesAdminAudio=[];
  void getAudio(){
    FirebaseFirestore.instance.collection('Audio').get().then((value) {
      // value.docs.forEach((element) {
      //   element.reference.collection('comments').get().then((value){
      //     comments.add(element.id);
      //   }).catchError(onError);
      // });

      value.docs.forEach((element) {

        element.reference.collection('likes').get().then((value){
          likesAdminAudio.add(value.docs.length);
          audioAdminId.add(element.id);//to get post id
          audioAdmin.add(PostModel.fromJson(element.data()));
          emit(GetUserPostSuccessState());
        }).catchError((error){
        });
        // print(postId);

      });
    });}

  List<CommentModel> getcomment=[];
  void getComments(String postId,String collection){
    FirebaseFirestore.instance
        .collection('$collection')
        .doc(postId)
        .collection('comments')
        .snapshots()
        .listen((event) {
      getcomment = [];

      event.docs.forEach((element) {
        getcomment.add(CommentModel.fromJson(element.data()));
      });

      emit(GetCommentSuccessState());
    });
  }


  void deleteUser(userId){
    FirebaseFirestore.instance.collection('User').doc(userId).delete();
    usersList.clear();
    getUsers();
  }
  void deletePost(postId,collection,Function function,Function getFun){
    FirebaseFirestore.instance.collection('$collection').doc(postId).delete();
    function();
    emit(VideoDeletedState());
    getFun();
  }


}