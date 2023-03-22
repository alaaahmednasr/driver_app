// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable, unused_element, unnecessary_new, unnecessary_null_comparison, deprecated_member_use, avoid_types_as_parameter_names

import 'package:dio/dio.dart';
import 'package:driver_app/modules/signup_screen/cubit/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import '../../../models/signup_model/signup_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());

  static SignUpCubit getCubit(Context) => BlocProvider.of(Context);

  bool isPassword = true;

  void isPasswordShown() {
    isPassword = !isPassword;
    emit(IsPasswordState());
  }

  bool isConfirmPassword = true;

  void isConfirmPasswordShown() {
    isConfirmPassword = !isConfirmPassword;
    emit(IsConfirmPasswordState());
  }

  late SignUpModel signUpModel;

  void userSignUp({
    required String phone,
    required String userName,
    required String password,
    required String nationalIdFrontpath,
    required String nationalIdBackpath,
    required String driverFrontpath,
    required String vehicleFrontpath,
  }) {
    Future uploadImage() async {
      FormData formdata = FormData.fromMap({
        'phone': phone,
        'name': userName,
        'password': password,
        "ID_front": await MultipartFile.fromFile(nationalIdFrontpath,
            filename: basename(nationalIdFrontpath)),
        "ID_back": await MultipartFile.fromFile(nationalIdBackpath,
            filename: basename(nationalIdBackpath)),
        "driver_front_license": await MultipartFile.fromFile(driverFrontpath,
            filename: basename(driverFrontpath)),
        "Vehicle_front_license": await MultipartFile.fromFile(vehicleFrontpath,
            filename: basename(vehicleFrontpath)),
      });
      return formdata;
    } 

    emit(SignUpLoadingState());

    uploadImage().then((value) =>
        DioHelper.postData(methodUrl: SIGNUP, data: value).then((value) {
          signUpModel = SignUpModel.fromJson(value.data);
          print(signUpModel.message);
          print(signUpModel.data?.token);
          emit(SignupScusessState(signUpModel));
        }).catchError((error) {
          print(error.toString());
          emit(SignupErrorState(error.toString()));
        }));
  }
}
