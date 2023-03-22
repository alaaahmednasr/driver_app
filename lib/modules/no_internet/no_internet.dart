// ignore_for_file: must_be_immutable

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({Key? key, required this.widget, required this.snapshot})
      : super(key: key);

  late AsyncSnapshot<ConnectivityResult> snapshot;
  late Widget widget;

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return Scaffold(
                body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/118789-no-internet.json'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: textPoppinsBold(
                          text: 'No internet Connection',
                          fontSize: 30,
                          textColor: const Color(0XFF345669)),
                    )
                  ]),
            ));
          default:
            return widget;
        }
      default:
        return widget;
    }
  }
}
