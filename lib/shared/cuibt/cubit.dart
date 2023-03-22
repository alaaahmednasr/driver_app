// ignore_for_file: non_constant_identifier_names

import 'package:driver_app/shared/cuibt/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit getCubit(Context) => BlocProvider.of(Context);

}
