import '../../../models/signup_model/signup_model.dart';

abstract class SignUpStates {}

class InitialState extends SignUpStates {}

class IsPasswordState extends SignUpStates {}

class IsConfirmPasswordState extends SignUpStates {}

class UploadImageScucessState extends SignUpStates {}

class UploadImageErrorState extends SignUpStates {}


class SignUpLoadingState extends SignUpStates {}

class SignupScusessState extends SignUpStates {
  SignUpModel signUpModel;
  
  SignupScusessState(this.signUpModel);
}

class SignupErrorState extends SignUpStates {
  final String? error;

  SignupErrorState(this.error);
}