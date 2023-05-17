import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent/layout/User/home.dart';
import 'package:talent/layout/admin/admin_home.dart';
import 'package:talent/layout/content_creator/home.dart';
import 'package:talent/modules/admin/admin_home/admin_Home.dart';
import 'package:talent/modules/login/cubit/cubit.dart';
import 'package:talent/modules/login/cubit/state.dart';
import 'package:talent/modules/register/register.dart';

final _formKey = GlobalKey<FormState>();
var emailController=TextEditingController();
var passwordController=TextEditingController();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account register now'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(26),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            
                            if(emailController.text=='admin'&&passwordController.text=='admin'){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AdminHomePage()), (route) => false);
                            }
                            LoginCubit.get(context).userLogin(mail: emailController.text, pass: passwordController.text,context: context);

                          }
                        },
                        child: Text('Login',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
