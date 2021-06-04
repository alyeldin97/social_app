import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_social_app/layout/layout_screen.dart';
import 'package:new_social_app/models/components.dart';
import 'package:new_social_app/shared/register_cubit.dart';
import 'package:new_social_app/shared/register_states.dart';


class SocialRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is SocialCreateUserSuccessState) {
            navigateAndFinish(
              context,
              LayoutScreen(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          title: 'User Name',
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          title: 'Email Address',
                          icon: Icon(Icons.email_outlined),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix:IconButton(icon:Icon(SocialRegisterCubit.get(context).suffix),onPressed: (){
                            SocialRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },),
                          onSubmit: (value) {},
                          isPassword:
                          SocialRegisterCubit.get(context).isPassword,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          title: 'Password',
                          icon: Icon(Icons.lock_outline),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          title: 'Phone',
                          icon: Icon(Icons.phone),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialCreateUserSuccessState,
                          builder: (context) => Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  SocialRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              child: Text('register'.toUpperCase()),
                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}