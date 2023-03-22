// ignore_for_file: unused_field, avoid_print, unnecessary_this, deprecated_member_use, unused_element

import 'package:driver_app/modules/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';
import '../signup_screen/cubit/signup_cubit.dart';
import '../signup_screen/cubit/signup_states.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var getCubit = SignUpCubit.getCubit(context);
          return Scaffold(
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // App Bar
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 140,
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
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 30,
                          top: 25,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_sharp,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingScreen(),
                                    ));
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            textPoppinsRegular(
                              text: 'Change Password',
                              textColor: Colors.white,
                              fontSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Change Password
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 3.1 Current Password Text
                          textPoppinsRegular(
                            text: 'Current Password',
                            fontSize: 18,
                          ),
                          // 3.2 Current Password Field
                          defaultTextFeild(
                            controller: currentPasswordController,
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
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // 3.3 New Password Text
                          textPoppinsRegular(
                            text: 'New Password',
                            fontSize: 18,
                          ),
                          // 3.4- New password Field
                          defaultTextFeild(
                            isPassword: getCubit.isConfirmPassword,
                            controller: newPasswordController,
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
                        ],
                      ),
                    ),
                    // Change Password Button
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: defaultButton(
                            buttonText: 'Change Password',
                            onTapFunction: (() {
                              if (formKey.currentState!.validate()) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const LoginScreen(),
                                //   ),
                                // );
                              }
                            })),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
