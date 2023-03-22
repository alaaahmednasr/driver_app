// ignore_for_file: avoid_print

import 'package:driver_app/modules/login_screen/cubit/login_cubit.dart';
import 'package:driver_app/modules/new_orders/cubit/order_cubit.dart';
import 'package:driver_app/modules/settings/local_states.dart';
import 'package:driver_app/modules/signup_screen/cubit/signup_cubit.dart';
import 'package:driver_app/shared/components/app_localization.dart';
import 'package:driver_app/shared/components/constants.dart';
import 'package:driver_app/shared/cuibt/observer.dart';
import 'package:driver_app/shared/network/local/cache_helper.dart';
import 'package:driver_app/shared/network/remote/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'modules/settings/local_cubit.dart';
import 'modules/task/my_task.dart';

// Run OnBackground
Future<void> _firebaseMessagingBackGroungHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  // Run OnBackground
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackGroungHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LocalCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (BuildContext context) => OrderCubit(),
        ),
      ],
      child: BlocBuilder<LocalCubit, ChangeLocalState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en", ""),
              Locale("ar", ""),
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            builder: (context, child) {
              return ResponsiveWrapper.builder(
                ClampingScrollWrapper(child: child!),
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ],
                breakpointsLandscape: [
                  const ResponsiveBreakpoint.resize(560, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(812, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1024, name: TABLET),
                  const ResponsiveBreakpoint.resize(1120, name: DESKTOP),
                ],
              );
            },
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const TaskScreen(),
          );
        },
      ),
    );
  }
}
