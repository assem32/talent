import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/models/comment.dart';
import 'package:talent/models/post_model.dart';
import 'package:talent/models/user_model.dart';
import 'package:talent/modules/User/add_user.dart';
import 'package:talent/modules/User/feed_dir/feed_home.dart';
import 'package:talent/modules/User/profile/profile.dart';
import 'package:talent/modules/User/search.dart';

import 'package:talent/modules/User/feed.dart';
import 'package:talent/modules/login/cubit/cubit.dart';
import 'package:talent/modules/login/login.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;




class UserLayoutCubit extends Cubit<UserStates> {
  UserLayoutCubit() : super(UserInit());

  static UserLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  void changeIndex(index){
    currentIndex=index;
    emit(ChangeIndexStateU());
  }

  List <Widget> pages=[
    UserHome(),
    SearchUser(),
    AddUserTalent(),
    UserProfile()
  ];


  List <PostModel> videoList=[];
  List <String> videoId=[];
  List <int> commentsVideo=[];
  List <int> likesVideo=[];
  void getVideos(){
    FirebaseFirestore.instance.collection('Video').get().then((value) {
      // value.docs.forEach((element) {
      //   element.reference.collection('comments').get().then((value){
      //     comments.add(element.id);
      //   }).catchError(onError);
      // });

      value.docs.forEach((element) {

          element.reference.collection('likes').get().then((value){
            likesVideo.add(value.docs.length);
            videoId.add(element.id);//to get post id
            videoList.add(PostModel.fromJson(element.data()));
            emit(GetUserPostSuccessState());
          }).catchError((error){
          });
          // print(postId);

        });
  });}

  List <PostModel> imageList=[];
  List <String> imageId=[];
  List <int> commentsImage=[];
  List <int> likesImage=[];
  void getImage(){
    FirebaseFirestore.instance.collection('Images').get().then((value) {
      value.docs.forEach((element) {
          element.reference.collection('likes').get().then((value){
            likesImage.add(value.docs.length);
            imageId.add(element.id);//to get post id
            imageList.add(PostModel.fromJson(element.data()));
            emit(GetUserPostSuccessState());
          }).catchError((error){
          });
        });
  });}


  List <PostModel> audioList=[];
  List <String> audioId=[];
  List <int> commentsAudio=[];
  List <int> likesAudio=[];
  void getAudio(){
    FirebaseFirestore.instance.collection('Audio').get().then((value) {

      value.docs.forEach((element) {

          element.reference.collection('likes').get().then((value){
            likesAudio.add(value.docs.length);
            audioId.add(element.id);//to get post id
            audioList.add(PostModel.fromJson(element.data()));
            emit(GetUserPostSuccessState());
          }).catchError((error){
          });
          // print(postId);

        });
  });}




  // void getLikes(postId,collection){
  //
  //   FirebaseFirestore.instance.collection('$collection').doc(postId).collection('likes').get().then((value){
  //     value.docs.forEach((element) {
  //       likes.add(element.data().length);
  //     });
  //
  //     emit(GetUserPostSuccessState1());
  //   }).catchError((error){
  //     print(error.toString());
  //   });
  // }
  void createComment(String text,String postId,dateTime,collection){
    CommentModel cModel=CommentModel(
      name: userModel?.name,
      uId: userModel?.uId,
      dateTime: dateTime,
      text: text,
    );
    FirebaseFirestore.instance
        .collection('$collection').doc(postId).collection('comments').add(cModel.toMap()).then((value) {
      emit(CreateCommentSuccessState());
    }).catchError((error){
      emit(CreateCommentErrorState());
    });

  }

  List<CommentModel> getcomment=[];
  void getComments(String postId,collection){
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
  void likePost(String postId,collection){
    FirebaseFirestore
        .instance
        .collection('$collection')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId).set({'likes': true})
        .then((value){
          print('t');
      emit(SocialLikePostSuccess());
    }).catchError((error){
      print(error.toString());
      emit(SocialLikePostError());
    }
    );
  }

  List<UserModel>usersList=[];

  void getUsers(){
    FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        usersList.add(UserModel.fromJson(element.data()));
      });
      print(usersList);
      emit(UserGetUsersState());
    }).catchError((error){
      print(error.toString());
    });
  }

  List<UserModel> searchList=[];
  void userSearch(name){
    searchList = usersList
        .where((element) => element.name!.contains(name.toLowerCase()))
        .toList();
    emit(SearchUserState());
  }

  File? imageFile;

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50,maxHeight: 250,maxWidth: 250);
    imageFile = pickedFile != null ? File(pickedFile.path) : null;
    emit(GetImageState());
  }


  File ?videoFile;
  var compressedVideo;
  VideoPlayerController ? videoController;

  Future<void> pickVideo() async {
    final pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      videoFile = File(pickedFile.path);
      videoController = VideoPlayerController.file(videoFile!)
        ..initialize().then((_) {
            videoController!.play();
            emit(VideoPlayState());

        });
    }

  }

  File? selectedFile;

  Future<void> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
        selectedFile = File(result.files.single.path!);
        emit(SoundSelectedState());
    }
  }



  void uploadDataPost({
    required String dateTime,
    required file,
    collection
  }){


    firebase_storage.FirebaseStorage.instance.ref().child('path/${Uri.file(file.path).pathSegments.last}').putFile(file)
        .then((value){
      value.ref.getDownloadURL().then((value){
        createPost(dateTime: dateTime,video: value,collection: collection);
        emit(UploadDataFirebaseSuccessState());

      }).catchError((error){});
      emit(UploadDataFirebaseErrorState());
    }).catchError((error){
      emit(UploadDataFirebaseErrorState());
    });
  }


  void createPost({
    required String dateTime,
    String ?video,
    collection
  }){
    // emit(SocialCreatePostLoadingState());
    PostModel model=PostModel(
      name: userModel?.name,
      uId: userModel?.uId,
      video: video,
      dateTime: dateTime,

    );
    FirebaseFirestore.instance.collection('$collection').add(model.toMap())
        .then((value){
      emit(SocialCreatePostSuccessState());
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }



  List<PostModel> userImage=[];
  List<String> userImageId=[];
  void profileImage(String ?userId){
    FirebaseFirestore.instance
        .collection('Images').orderBy('dateTime').snapshots().listen((event) {
      userImage=[];
      event.docs.forEach((element) {
        if(element.data()['uId']==userId) {
          userImage.add(PostModel.fromJson(element.data()));
          userImageId.add(element.id);
        }
      });
      print(userImage);
      emit(GetProfileImageSuccessState());
    });
  }

  List<PostModel> userVideo=[];
  List<String> userVideoId=[];
  void profileVideo(String ?userId){
    FirebaseFirestore.instance
        .collection('Video').orderBy('dateTime').snapshots().listen((event) {
      userVideo=[];
      event.docs.forEach((element) {
        if(element.data()['uId']==userId) {
          userVideo.add(PostModel.fromJson(element.data()));
          userVideoId.add(element.id);
        }
      });
      print(userVideo);
      emit(GetProfileImageSuccessState());
    });
  }

  List<PostModel> userAudio=[];
  List<String> userAudioId=[];
  void profileAudio(String ?userId){
    FirebaseFirestore.instance
        .collection('Audio').orderBy('dateTime').snapshots().listen((event) {
      userAudio=[];
      event.docs.forEach((element) {
        if(element.data()['uId']==userId) {
          userAudio.add(PostModel.fromJson(element.data()));
          userAudioId.add(element.id);
        }
      });
      print(userAudio);
      emit(GetProfileImageSuccessState());
    });
  }

  List<CommentModel> getcommentAudio=[];
  void getCommentsAudio(String postId){
    FirebaseFirestore.instance
        .collection('Audio')
        .doc(postId)
        .collection('comments')
        .snapshots()
        .listen((event) {
      getcommentAudio = [];

      event.docs.forEach((element) {
        getcommentAudio.add(CommentModel.fromJson(element.data()));
      });

      emit(GetCommentSuccessState());
    });
  }
  List<CommentModel> getcommentImage=[];
  void getCommentsImage(String postId,collection){
    FirebaseFirestore.instance
        .collection('$collection')
        .doc(postId)
        .collection('comments')
        .snapshots()
        .listen((event) {
      getcommentImage = [];

      event.docs.forEach((element) {
        getcommentImage.add(CommentModel.fromJson(element.data()));
      });

      emit(GetCommentSuccessState());
    });
  }
  List<CommentModel> getcommentVideo=[];
  void getCommentsVideo(String postId){
    FirebaseFirestore.instance
        .collection('Video')
        .doc(postId)
        .collection('comments')
        .snapshots()
        .listen((event) {
      getcommentVideo = [];

      event.docs.forEach((element) {
        getcommentVideo.add(CommentModel.fromJson(element.data()));
      });

      emit(GetCommentSuccessState());
    });
  }


  bool playing=true;

  void changePlaying(){
    playing=!playing;

    emit(MusicPageChange());
  }

  void enterStop(){
    playing=true;
    emit(MusicPageChange());
  }

  void userSignOut(context){
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
    }).catchError((error){
      print(error.toString());
    });
  }




  }

