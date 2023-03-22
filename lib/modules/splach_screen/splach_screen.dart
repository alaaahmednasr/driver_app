import 'package:driver_app/shared/components/app_localization.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../login_screen/login_screen.dart';
import '../signup_screen/basic_data/signup_first_basic_data.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1- Making Splach Image
          Container(
            padding: const EdgeInsetsDirectional.only(
              top: 20,
            ),
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage('assets/splach.PNG'),
              width: 270,
              height: 320,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // 1- Making Login Button
          defaultButton(
            buttonText: "${getLang(context , "login")}",
            onTapFunction: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 40,
          ),
          // 1- Making Signup Button
          defaultButton(
            buttonText: "${getLang(context , "signup")}",
            buttonColor: const Color(0XFFE44544).withOpacity(.25),
            textColor: const Color(0XFF43494B),
            onTapFunction: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
