abstract class MainStates{}

class MainInitialState extends MainStates{}

class MainGetUserSuccessState extends MainStates{}
class MainGetUserLoadingState extends MainStates{}
class MainGetUserErrorState extends MainStates{
  String error;
  MainGetUserErrorState(this.error);
}

class MainChangeBottomNav extends MainStates{}