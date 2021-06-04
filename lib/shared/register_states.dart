abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class SocialRegisterLoadingState extends RegisterStates{}
class SocialRegisterSuccessState extends RegisterStates{}
class SocialRegisterErrorState extends RegisterStates{
  String error;
  SocialRegisterErrorState(this.error);
}

class SocialCreateUserSuccessState extends RegisterStates{}
class SocialCreateUserErrorState extends RegisterStates{
  String error;
  SocialCreateUserErrorState(this.error);
}

class SocialChangePasswordVisibilityRegisterstate extends RegisterStates{}