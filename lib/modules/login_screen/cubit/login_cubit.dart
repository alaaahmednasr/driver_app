// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:driver_app/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/login_model/login_model.dart';
import '../../../shared/network/remote/dio.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit getCubit(context) => BlocProvider.of(context);

  bool isPassword = true;

  void isPasswordShown() {
    isPassword = !isPassword;
    emit(IsPasswordState());
  }

  late LoginModel loginModel;

  void userLogin({
    required String phone,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(methodUrl: LOGIN, data: {
      'phone': phone,
      'password': password,
    })
    .then((value) {
      loginModel = LoginModel.fromJson(value.data);

      print(loginModel.message);
      print(loginModel.data?.token);

      emit(LoginScusessState(loginModel));
    });
    // .catchError((error) {
    //   print(error.toString());
    //   emit(LoginErrorState(error.toString()));
    // });
  }
}
