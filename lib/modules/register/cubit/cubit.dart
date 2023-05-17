import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent/layout/User/cubit/state.dart';
import 'package:talent/layout/content_creator/cubit/state.dart';
import 'package:talent/layout/content_creator/home.dart';
import 'package:talent/models/user_model.dart';
import 'package:talent/modules/User/search.dart';
import 'package:talent/modules/contnent_creator/add_content.dart';
import 'package:talent/modules/User/feed.dart';
import 'package:talent/modules/login/cubit/cubit.dart';
import 'package:talent/modules/register/cubit/state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInit());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    name,
    email,
    password,
    phone,
    role,
    context,
  }) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(name: name,phone: phone,email: email,uid: value.user?.uid,role: role);

      if(role=='User') {
        emit(RegisterSuccessUserState());
      } else if(role=='Content Creator')
        emit(RegisterSuccessCreatorState());


    })
        .catchError((error){
      print(error.toString());
    });
  }
  void userCreate({
    name,
    email,
    phone,
    uid,
    role
  }){
    UserModel model =UserModel(
        mail: email,
        phone: phone,
        name: name,
        uId: uid,
      role: role
    );
    FirebaseFirestore.instance.collection('User').doc(uid).set(model.toMap()).then((value) {
      userModel=model;
    });

  }
}