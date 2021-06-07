abstract class MainStates{}

class MainInitialState extends MainStates{}

class MainGetUserSuccessState extends MainStates{}
class MainGetUserLoadingState extends MainStates{}
class MainGetUserErrorState extends MainStates{
  String error;
  MainGetUserErrorState(this.error);
}

class MainChangeBottomNav extends MainStates{}

class MainNewPostState extends MainStates{}

class MainProfileImagePickedSuccessState extends MainStates{}
class MainProfileImagePickedErrorState extends MainStates{}

class MainCoverImagePickedSuccessState extends MainStates{}
class MainCoverImagePickedErrorState extends MainStates{}

class MainProfileImageUploadedSuccessState extends MainStates{}
class MainProfileImageUploadedErrorState extends MainStates{}

class MainCoverImageUploadedSuccessState extends MainStates{}
class MainCoverImageUploadedErrorState extends MainStates{}

class MainUpdateUserLoadingState extends MainStates{}
class MainUpdateUserErrorState extends MainStates{}