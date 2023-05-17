import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/cubit/cubit.dart';
import 'package:talent/layout/User/home.dart';
import 'package:talent/layout/admin/admin_home.dart';
import 'package:talent/layout/admin/cubit/cubit.dart';
import 'package:talent/layout/content_creator/cubit/cubit.dart';
import 'package:talent/layout/content_creator/home.dart';
import 'package:talent/modules/User/add_user.dart';
import 'package:talent/modules/User/feed.dart';
import 'package:talent/modules/admin/admin_home/admin_Home.dart';
import 'package:talent/modules/admin/admin_home/admin_video.dart';
import 'package:talent/modules/login/login.dart';
import 'package:talent/modules/register/cubit/cubit.dart';
import 'package:talent/modules/register/register.dart';

import 'modules/User/sound.dart';
import 'modules/contnent_creator/add_content.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>LayoutCubit()),
        BlocProvider(create: (BuildContext context)=>RegisterCubit()),
        BlocProvider(create: (BuildContext context)=>UserLayoutCubit()),
        BlocProvider(create: (BuildContext context)=>AdminLayoutCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
