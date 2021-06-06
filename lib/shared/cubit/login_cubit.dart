import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/layout/layout_screen.dart';
import 'package:new_social_app/shared/components.dart';
import 'package:new_social_app/shared/states/login_states.dart';
import 'package:flutter/material.dart';

class SocialLogInCubit extends Cubit<SocialLoginstates>{
  SocialLogInCubit(): super(InitialSocialLoginState());

  static SocialLogInCubit get(context){
    return BlocProvider.of(context);
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;

  void changePasswordVisibility(){
    isPassword=!isPassword;
    suffix=isPassword? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityState());
  }

  void userLogin({String email, String password,var context}) {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {

      emit(SocialLoginSuccessState(value.user.uid));
    }).catchError((error) {
      print(error.toString());
      emit(SocialLoginErrorState());
    }
    );
  }
}