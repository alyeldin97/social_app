import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/models/user_model.dart';
import 'package:new_social_app/shared/states/register_states.dart';

class SocialRegisterCubit extends Cubit<RegisterStates> {
  SocialRegisterCubit() : super(RegisterInitialState());

  static SocialRegisterCubit get(context) {
    return BlocProvider.of(context);
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityRegisterstate());
  }

  void userRegister(
      {String name, String password, String email, String phone}) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      userCreate(name: name, phone: phone, email: email, uId: value.user.uid);
    }).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    String name,
    String email,
    String phone,
    String uId,
  }) {
    UserModel model = UserModel(
        cover:
            'https://image.freepik.com/free-photo/portrait-smiling-young-man-pointing-his-finger-downward-orange-backdrop_23-2148119669.jpg',
        bio: 'Write Your Bio',
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        isEmailVerified: false,
        image:
            'https://image.freepik.com/free-photo/bearded-happy-looking-man-with-brunette-hair-has-piercing-wearing-black-sweater-holding-pointing-finger-smartphone-copy-space-isolated-yellow-wall_295783-14549.jpg');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }
}
