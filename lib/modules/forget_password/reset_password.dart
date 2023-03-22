// ignore_for_file: must_be_immutable

import 'package:driver_app/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/app_localization.dart';
import '../../shared/components/components.dart';
import '../signup_screen/cubit/signup_cubit.dart';
import '../signup_screen/cubit/signup_states.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 1- Reset Password Container
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          height: 258,
                          decoration: const BoxDecoration(
                            color: Color(0XFFE44544),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                60,
                              ),
                              bottomRight: Radius.circular(
                                60,
                              ),
                            ),
                          ),
                          child: const Image(
                            image: AssetImage('assets/forget-password.PNG'),
                            width: 250,
                            height: 250,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // 2- Forget Password Text
                        textPoppinsRegular(
                          text: "${getLang(context, "create_new_password")}",
                          fontSize: 30,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // 3-  Password Form Field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 3.1 New Password Text
                              textPoppinsRegular(
                                text: "${getLang(context, "new_password")}",
                                fontSize: 18,
                              ),
                              // 3.2 New Password Field
                              defaultTextFeild(
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                isPassword: getCubit.isPassword,
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
                                  } else if (!value
                                      .contains(RegExp(r'[A-Z]'))) {
                                    return ('Password must contain at least one upper char');
                                  } else if (!value
                                      .contains(RegExp(r'[a-z]'))) {
                                    return ('Password must contain at least one lower char');
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              // 3.3 confirm Password Text
                              textPoppinsRegular(
                                text: "${getLang(context, "confirm_password")}",
                                fontSize: 18,
                              ),
                              // 3.4- confirm password Field
                              defaultTextFeild(
                                isPassword: getCubit.isConfirmPassword,
                                controller: confirmPasswordController,
                                type: TextInputType.visiblePassword,
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // 4- Next Button
                        Center(
                          child: defaultButton(
                              buttonText: "${getLang(context, "change_password")}",
                              onTapFunction: (() {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                }
                              })),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
