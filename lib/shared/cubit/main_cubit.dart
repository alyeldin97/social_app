import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_social_app/models/user_model.dart';
import 'package:new_social_app/modules/chats_screen.dart';
import 'package:new_social_app/modules/feeds_screen.dart';
import 'package:new_social_app/modules/new_post_screen.dart';
import 'package:new_social_app/modules/settings_screen.dart';
import 'package:new_social_app/modules/users_screen.dart';
import 'package:new_social_app/shared/constants.dart';
import 'package:new_social_app/shared/states/main_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) {
    return BlocProvider.of(context);
  }

  UserModel model;

  void getUserData() {
    emit(MainGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = UserModel.fromJSON(value.data());
      emit(MainGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MainGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(MainNewPostState());
    } else {
      currentIndex = index;
      emit(MainChangeBottomNav());
    }
  }

  File profileImage;
  String profileImageUrl = '';
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(MainProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(MainProfileImagePickedErrorState());
    }
  }

  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        print(value);
        emit(MainProfileImageUploadedSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(MainProfileImageUploadedErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(MainProfileImageUploadedErrorState());
    });
  }

  File coverImage;
  String coverImageUrl = '';

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(MainCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(MainCoverImagePickedErrorState());
    }
  }

  void uploadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        coverImageUrl = value;
        print(value);
        emit(MainCoverImageUploadedSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(MainCoverImageUploadedErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(MainCoverImageUploadedErrorState());
    });
  }

  void updateUser({String name,String bio,String phone}) {
    emit(MainUpdateUserLoadingState());

    if(coverImage!=null){
      uploadCoverImage();
    }else if(profileImage!=null){
      uploadProfileImage();
    }else if(coverImage!=null && profileImage!=null){
      uploadCoverImage();
      uploadProfileImage();
    }else{
      updateUserData(bio: bio,name: name);
    }
  }

  void updateUserData({String bio,String name}){
    UserModel modelWithoutImage = UserModel(
      bio: bio,
      name: name,
      uId: model.uId,
      cover: model.cover,
      image: model.image,
      email:model.email,
      isEmailVerified: false,
      phone: model.phone,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .update(
        modelWithoutImage.toMap()
    )
        .then((value) {
      getUserData();
    })
        .catchError((error) {
      print(error.toString());
      emit(MainUpdateUserErrorState());
    });
  }
}
