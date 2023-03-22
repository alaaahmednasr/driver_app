// ignore_for_file: avoid_print, unused_local_variable

import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/app_localization.dart';
import '../../../shared/components/global_variables.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_states.dart';
import '../upload_attatchments/start_screen/start_screen.dart';

class SignUpSecondScreen extends StatefulWidget {
  const SignUpSecondScreen({Key? key}) : super(key: key);

  @override
  SignUpSecondScreenState createState() => SignUpSecondScreenState();
}

class SignUpSecondScreenState extends State<SignUpSecondScreen> {
  final pageController = PageController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var getCubit = SignUpCubit.getCubit(context);
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
                    appBarContainer(
                      text: "${getLang(context, "signup")}",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // 2- Stepper
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
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
                    StepperContent(context),

                    // 3- Make Form Fields
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          // 3.1- username
                          defaultTextFeild(
                            controller: userController,
                            type: TextInputType.name,
                            labelText: "${getLang(context, "user_name")}",
                            submitFunction: (String? value) {
                              return value;
                            },
                            validFunction: (String? value) {
                              if (value!.isEmpty) {
                                return ('Username mustn\'t be empty');
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // 3.2- password
                          defaultTextFeild(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            isPassword: getCubit.isPassword,
                            labelText: "${getLang(context, "password")}",
                            suffix: getCubit.isPassword
                                ? Icons.visibility_off
                                : Icons.visibility_sharp,
                            onTapSuffixIconFunction: () {
                              getCubit.isPasswordShown();
                            },
                            submitFunction: (String? value) {
                              return value;
                            },
                            validFunction: (String? value) {
                              if (value!.isEmpty) {
                                return ('Password mustn\'t be empty');
                              } else if (value.length < 10) {
                                return ('Password is too short');
                              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                                return ('Password must contain at least one upper char');
                              } else if (!value.contains(RegExp(r'[a-z]'))) {
                                return ('Password must contain at least one lower char');
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // 3.3- confirm password
                          defaultTextFeild(
                            isPassword: getCubit.isConfirmPassword,
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            labelText:
                                "${getLang(context, "confirm_password")}",
                            suffix: getCubit.isConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility_sharp,
                            submitFunction: (String? value) {
                              return value;
                            },
                            onTapSuffixIconFunction: () {
                              getCubit.isConfirmPasswordShown();
                            },
                            validFunction: (String? value) {
                              if (value!.isEmpty) {
                                return ('Password mustn\'t be empty');
                              } else if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return ('Password does\'t match');
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // 3.4- Agree Text
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textPoppinsRegular(
                                  text: "${getLang(context, "text1")}",
                                  fontSize: 14,
                                  textColor:
                                      const Color(0XFF43494B).withOpacity(0.8),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    textPoppinsRegular(
                                      text: "${getLang(context, "text2")}",
                                      fontSize: 14,
                                      textColor: const Color(0XFF43494B)
                                          .withOpacity(0.8),
                                    ),
                                    defaultTextButton(
                                        text: "${getLang(context, "privacy")}",
                                        textColor: const Color(0XFFE44544)
                                            .withOpacity(0.8),
                                        decoration: TextDecoration.none,
                                        textFunction: () {
                                          //   Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => ,
                                          //   ),
                                          // );
                                        }),
                                    textPoppinsRegular(
                                      text: "${getLang(context, "text3")}",
                                      fontSize: 14,
                                      textColor: const Color(0XFF43494B)
                                          .withOpacity(0.8),
                                    ),
                                    defaultTextButton(
                                        text: "${getLang(context, "terms")}",
                                        textColor: const Color(0XFFE44544)
                                            .withOpacity(0.8),
                                        decoration: TextDecoration.none,
                                        textFunction: () {
                                          //   Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => ,
                                          //   ),
                                          // );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // 3.5- Signup Button
                          defaultButton(
                            onTapFunction: (() {
                              if (formKey.currentState!.validate()) {
                                userName = userController.text;
                                password = passwordController.text;
                                print('**********************************');
                                print(phoneNumber);
                                print(otp);
                                print(userName);
                                print(password);
                                print('**********************************');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UploadAttatchmentStartScreen(),
                                  ),
                                );
                              }
                            }),
                            buttonText: "${getLang(context, "signup")}",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
