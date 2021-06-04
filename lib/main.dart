import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/modules/login_screen.dart';
import 'package:new_social_app/shared/login_cubit.dart';

import 'bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SocialLogInCubit()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Social App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: SocialLoginScreen(),
      ),
    );
  }
}
