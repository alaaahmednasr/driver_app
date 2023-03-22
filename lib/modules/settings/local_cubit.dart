// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:driver_app/modules/settings/local_states.dart';
import 'package:driver_app/shared/components/global_variables.dart';
import 'package:driver_app/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCubit extends Cubit<ChangeLocalState> {
  LocalCubit() : super(ChangeLocalState(const Locale("en")));

  static LocalCubit getCubit(context) => BlocProvider.of(context);

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await CacheHelper.getCacheLanguageCode();
    emit(ChangeLocalState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    header['lang'] = languageCode ;
    headerWithToken['lang'] = languageCode ;
    await CacheHelper.cacheLanguageCode(languageCode);
    emit(ChangeLocalState(Locale(languageCode)));
  }
}
