// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:driver_app/modules/new_orders/new_order.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../shared/network/local/cache_helper.dart';
import '../splach_screen/splach_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

   dynamic token = CacheHelper.getData(key: 'token');

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (token != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const NewOrderScreen(),
          ),
          (route) => false,
        );
      }
      else{
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SplachScreen(),
          ),
          (route) => false,
        );

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE44544),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1- Making Logo Image Of App
              Container(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                ),
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // 2- Making Head Text
              textPoppinsBold(
                text: 'Redirect the Delivery - Closer - Faster',
              ),
              const SizedBox(
                height: 50,
              ),
              // 3- Making Welcome Text
              textPoppinsMedium(
                text: 'Welcome to the',
              ),
              textPoppinsMedium(
                text: 'Driver app',
              ),
              const SizedBox(
                height: 40,
              ),
              // 4- Making Location Image
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 300,
                child: Lottie.asset('assets/86890-location.json'),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//AssetImage('assets/location.png'),