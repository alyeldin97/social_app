import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/models/user_model.dart';
import 'package:new_social_app/shared/constants.dart';
import 'package:new_social_app/shared/states/main_states.dart';

class MainCubit extends Cubit<MainStates>{
  MainCubit():super(MainInitialState());
  
  static MainCubit get(context){
    return BlocProvider.of(context);
  }
  UserModel model;
  
  void getUserData(){
    emit(MainGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model= UserModel.fromJSON(value.data());
      emit(MainGetUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(MainGetUserErrorState(error.toString()));
    });
  }

  int currentIndex=0;
  List<Widget> screens=[

  ];

  void changeBottomNav(int index){
    currentIndex=index;
    emit(MainChangeBottomNav());
  }
}