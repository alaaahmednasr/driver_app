// ignore_for_file: avoid_print, unused_field, unnecessary_this, deprecated_member_use

import 'package:driver_app/modules/signup_screen/basic_data/signup_first_basic_data.dart';
import 'package:driver_app/modules/signup_screen/basic_data/signup_second_basic_data.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:driver_app/shared/components/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../shared/components/app_localization.dart';

class VertificationScreen extends StatefulWidget {
  const VertificationScreen({Key? key}) : super(key: key);

  @override
  VertificationScreenState createState() => VertificationScreenState();
}

class VertificationScreenState extends State<VertificationScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final pageController = PageController();
  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1- Making Signup Container
                secoundaryAppBarContainer(onPressed: (() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                })),
                const SizedBox(
                  height: 20,
                ),
                // 2- Making Stepper
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF80AF50),
                                size: 16.0,
                              ),
                              Icon(
                                Icons.circle,
                                color: Color(0xFFE44544),
                                size: 16.0,
                              ),
                              Icon(
                                Icons.circle,
                                color: Color(0xFFE44544),
                                size: 16.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      bottom: 60, start: 35, end: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textPoppinsRegular(
                        text: "${getLang(context, "basic_data")}",
                        fontSize: 12,
                        textColor: const Color(0XFF43494B).withOpacity(.6),
                      ),
                      textPoppinsRegular(
                        text: "${getLang(context, "vertification")}",
                        fontSize: 12,
                        textColor: const Color(0XFF43494B).withOpacity(.6),
                      ),
                      Column(
                        children: [
                          textPoppinsRegular(
                            text: "${getLang(context, "upload")}",
                            fontSize: 12,
                            textColor: const Color(0XFF43494B).withOpacity(.6),
                          ),
                          textPoppinsRegular(
                            text: "${getLang(context, "attatchments")}",
                            fontSize: 12,
                            textColor: const Color(0XFF43494B).withOpacity(.6),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      // 1- Text
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textPoppinsRegular(
                          text: "${getLang(context, "verfiy_code")}",
                          fontSize: 25,
                          textColor: const Color(0XFF43494B),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textPoppinsRegular(
                          text: "${getLang(context, "message1")}",
                          fontSize: 18,
                          textColor: const Color(0XFF43494B).withOpacity(0.76),
                        ),
                        textPoppinsRegular(
                          text: "${getLang(context, "message2")}",
                          fontSize: 18,
                          textColor: const Color(0XFF43494B).withOpacity(0.76),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        // 2- OTP Pattern
                        Pinput(
                          length: 4,
                          controller: otpController,
                          defaultPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0XFF43494B),
                              fontFamily: 'PoppinsRegular',
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          errorTextStyle: TextStyle(
                            color: Colors.red[400],
                            backgroundColor: const Color(0xFFf5c6c0),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return ('Please enter code');
                            }
                            return null;
                          },
                          onCompleted: (value) {
                            otp = value.characters.string;
                          },
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        // 3- verify Button
                        Center(
                          child: defaultButton(
                            buttonText: "${getLang(context, "verfiy")}",
                            onTapFunction: (() {
                              if (formKey.currentState!.validate()) {
                                print(otp);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpSecondScreen(),
                                  ),
                                );
                              }
                            }),
                          ),
                        ),
                        // 4- Send Again Text Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textPoppinsRegular(
                                text:
                                    "${getLang(context, "have_not_recived_code")}",
                                fontSize: 14,
                                textColor:
                                    const Color(0XFF43494B).withOpacity(.5)),
                            defaultTextButton(
                              text: "${getLang(context, "send_again")}",
                              fontSize: 14,
                              textColor: const Color(0XFFE44544),
                              decoration: TextDecoration.none,
                              textFunction: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
