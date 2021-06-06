import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/layout/layout_screen.dart';
import 'package:new_social_app/modules/login_screen.dart';
import 'package:new_social_app/shared/cache_helper.dart';
import 'package:new_social_app/shared/constants.dart';
import 'package:new_social_app/shared/cubit/login_cubit.dart';
import 'package:new_social_app/shared/cubit/main_cubit.dart';

import 'bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId=CacheHelper.getData(key:'uId');
  Bloc.observer = MyBlocObserver();
  Widget startWidget;
  if(uId==null){
    startWidget=SocialLoginScreen();
  }else{
    startWidget=LayoutScreen();
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SocialLogInCubit()),
        BlocProvider(create: (context)=>MainCubit()..getUserData()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Social App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: startWidget,
      ),
    );
  }
}
