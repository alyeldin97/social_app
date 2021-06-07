import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_social_app/shared/components.dart';
import 'package:new_social_app/shared/cubit/main_cubit.dart';
import 'package:new_social_app/shared/states/main_states.dart';
import 'package:new_social_app/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          var user = cubit.model;
          var profileImage=cubit.profileImage;
          nameController.text=user.name;
          bioController.text=user.bio;
          return Scaffold(
            appBar: defaultAppBar(
                title: 'Edit Your Profile',
                context: context,
                actions: [
                  TextButton(
                      onPressed: () {
                       cubit.updateUser(
                         name: nameController.text,bio:bioController.text
                       );
                      },
                      child: Text(
                        'Update',
                      )),
                ]),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  if(state is MainUpdateUserLoadingState)  LinearProgressIndicator(),
                  Container(
                    height: 210,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: cubit.coverImage==null?NetworkImage(user.cover):FileImage(cubit.coverImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircleAvatar(
                                    radius: 20.0,
                                    child: IconButton(
                                        onPressed: () {
                                          cubit.getCoverImage();
                                        },
                                        icon: Icon(IconBroken.Camera))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 100,
                          //height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 64,
                                child: CircleAvatar(
                                  radius: 59,
                                  backgroundImage:profileImage==null? NetworkImage(user.image):FileImage(profileImage),
                                ),
                              ),
                              CircleAvatar(
                                  radius: 20.0,
                                  child: IconButton(
                                      onPressed: () {
                                        cubit.getProfileImage();
                                      },
                                      icon: Icon(IconBroken.Camera))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Cannot Be Empty';
                      } else {
                        return null;
                      }
                    },
                    title: 'Name',
                    prefix: IconBroken.User,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    controller: bioController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Cannot Be Empty';
                      } else {
                        return null;
                      }
                    },
                    title: 'Bio',
                    prefix: IconBroken.Info_Circle,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
