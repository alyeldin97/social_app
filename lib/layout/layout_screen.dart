import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/shared/components.dart';
import 'package:new_social_app/shared/cubit/main_cubit.dart';
import 'package:new_social_app/shared/states/main_states.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: ConditionalBuilder(
              condition: cubit.model!=null,
              fallback: (context)=>Center(child: CircularProgressIndicator()),
              builder:(context)=> Column(
                children: [
                  ConditionalBuilder(
                    condition: !FirebaseAuth.instance.currentUser.emailVerified,
                    builder: (context)=>Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.amberAccent.withOpacity(0.2),
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.warning_amber_outlined),
                        SizedBox(width: 20,),
                        Expanded(child: Text('Please verify your email')),
                        SizedBox(width: 20,),
                        Expanded(child: ElevatedButton(onPressed: (){
                          FirebaseAuth.instance.currentUser.sendEmailVerification().then((value) {
                            showToast(text: 'Please Check Your Email', color: Colors.grey);
                          }).catchError((error){

                          });
                        }, child: Text('Send'))),
                      ],
                    ),
                  ),
                  fallback:(context)=> Container(),),

                ],
              ),
            ),
          );
        });
  }
}
