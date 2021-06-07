import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/modules/new_post_screen.dart';
import 'package:new_social_app/shared/components.dart';
import 'package:new_social_app/shared/cubit/main_cubit.dart';
import 'package:new_social_app/shared/states/main_states.dart';
import 'package:new_social_app/shared/styles/icon_broken.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {
          if(state is MainNewPostState){
            navigateTo(context, NewPostScreen());
          }
        },
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification)),
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Search)),
              ],
            ),
            body:cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)=>cubit.changeBottomNav(index),
              items: [
                buildBottomNavItem(IconBroken.Home,'Home'),
                buildBottomNavItem(IconBroken.Chat,'Chats'),
                buildBottomNavItem(IconBroken.Upload,'Post'),
                buildBottomNavItem(IconBroken.Location,'Users'),
                buildBottomNavItem(IconBroken.Setting,'Settings'),
              ],
            ),
          );
        });
  }

  BottomNavigationBarItem buildBottomNavItem(IconData icon,String label){
    return BottomNavigationBarItem(icon: Icon(icon),label:label);
  }
}
