
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/home.dart';
import 'package:talent/layout/content_creator/home.dart';
import 'package:talent/models/user_model.dart';
import 'package:talent/modules/login/cubit/state.dart';
import 'package:talent/modules/register/cubit/state.dart';

UserModel ?userModel;

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String mail,
    required String pass,
  context}){
    // emit(SocialLoadingLoginState());
    FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: mail,
        password: pass
    ).then((value) {
      FirebaseFirestore.instance.collection('User').doc(value.user?.uid).get().then((value) {
        userModel=UserModel.fromJson(value.data());
        if(userModel?.role=='User'){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UserHomePage()), (route) => false);
        }
        if(userModel?.role=='Content Creator'){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
        }
      }).catchError((error){
        print(error.toString());
      });
      emit(LoginSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorLoginState());
    });
  }
}