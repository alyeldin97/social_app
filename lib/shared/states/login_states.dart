abstract class SocialLoginstates{}

class InitialSocialLoginState extends SocialLoginstates{}

class SocialLoginLoadingState extends SocialLoginstates{}

class SocialLoginSuccessState extends SocialLoginstates{
  final String uId;
  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends SocialLoginstates{
}

class SocialChangePasswordVisibilityState extends SocialLoginstates{}