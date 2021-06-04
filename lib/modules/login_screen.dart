import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/models/components.dart';
import 'package:new_social_app/modules/register_screen.dart';
import 'package:new_social_app/shared/login_cubit.dart';
import 'package:new_social_app/shared/login_states.dart';

class SocialLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var formKey=GlobalKey<FormState>();
    var emailController =TextEditingController();
    var passwordController =TextEditingController();
    return BlocConsumer<SocialLogInCubit,SocialLoginstates>(
        listener: (context,state){
          if(state is SocialLoginSuccessState){

          }else{
            //SHOW TOAST
            //print();
          }
        },
        builder:(context,state){
          var cubit=SocialLogInCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LOGIN', style: Theme
                        .of(context)
                        .textTheme
                        .headline6,),
                    Text('log in now to chat with friends', style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey),),
                    SizedBox(height: 30,),
                    defaultFormField(
                      type: TextInputType.emailAddress,
                      controller:emailController,
                      validate: (String value) {
                        if (value.isEmpty) return 'Please Enter Your Email Address';
                      },
                      icon:Icon(Icons.email),
                      title:'E-mail Address',

                    ),
                    SizedBox(height: 15.0,),
                    defaultFormField(
                      suffix: IconButton(icon:Icon(cubit.suffix),onPressed: (){
                        cubit.changePasswordVisibility();
                      },),
                      type: TextInputType.visiblePassword,
                      controller:passwordController,
                      validate: (String value) {
                        if (value.isEmpty) return 'Password is too short';
                      },
                      icon:Icon(Icons.lock),
                      title:'Password',

                    ),
                    SizedBox(height: 15,),
                    Container(width:double.infinity,child: ElevatedButton(onPressed: (){
                      cubit.userLogin(email:emailController.text ,password: passwordController.text);
                    }, child: Text('LOGIN'))),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold),),
                        TextButton(onPressed: (){
                          navigateTo(context, SocialRegisterScreen());
                        },child: Text('REGISTER HERE'),),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
