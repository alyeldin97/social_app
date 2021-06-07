import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/modules/edit_profile_screen.dart';
import 'package:new_social_app/shared/components.dart';
import 'package:new_social_app/shared/cubit/main_cubit.dart';
import 'package:new_social_app/shared/states/main_states.dart';
import 'package:new_social_app/shared/styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder:(context,state){
        var user= MainCubit.get(context).model;
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 210,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              user.cover),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //width: 100,
                    //height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: CircleAvatar(
                      radius: 64,
                      child: CircleAvatar(
                        radius: 59,
                        backgroundImage: NetworkImage(
                            user.image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(
              user.name,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                user.bio,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap:(){},
                    child: Column(
                      children: [
                        Text(
                          '100',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Post',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap:(){},
                    child: Column(
                      children: [
                        Text(
                          '250',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Photos',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap:(){},
                    child: Column(
                      children: [
                        Text(
                          '10k',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap:(){},
                    child: Column(
                      children: [
                        Text(
                          '100',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(children: [
              Expanded(child: OutlinedButton(onPressed: (){}, child: Text('Add Photos'))),
              SizedBox(width: 10,),
              OutlinedButton(onPressed: (){
                navigateTo(context, EditProfileScreen());
              }, child: Icon(IconBroken.Edit),),
            ],),
          ],
        ),
      );}
    );
  }
}
