// ignore_for_file: avoid_print, unused_local_variable, unused_field, unrelated_type_equality_checks

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:driver_app/modules/forget_password/forget_password.dart';
import 'package:driver_app/modules/new_orders/new_order.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../shared/components/app_localization.dart';
import '../../shared/network/local/cache_helper.dart';
import '../signup_screen/basic_data/signup_first_basic_data.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool isChecked = false;
  late String selectedCountryCode;
  // var connectivityResult = Connectivity().checkConnectivity();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginScusessState) {
          if (state.loginModel.success) {
            print(state.loginModel.message);
            CacheHelper.saveData(
                    key: 'token', value: state.loginModel.data!.token)
                .then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewOrderScreen(),
                ),
                (route) => false,
              );
            });
          } else {
            print(state.loginModel.message);
            Fluttertoast.showToast(
                msg: state.loginModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (BuildContext context, Object? state) {
        var getCubit = LoginCubit.getCubit(context);
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1- Making Login App Bar Container
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        height: 231,
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
                            top: 30,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textPoppinsRegular(
                                text: "${getLang(context, "welcome_text")}",
                                fontSize: 40,
                                textColor: Colors.white,
                              ),
                              const Image(
                                width: 100,
                                height: 100,
                                image: AssetImage(
                                  'assets/loginWelcome.PNG',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      // 2- Form Fields
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 30.0,
                          start: 30,
                          end: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1- Make Signin Text
                            textPoppinsRegular(
                              text: "${getLang(context, "signin_text")}",
                              fontSize: 20,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // 2- Make Phone Number Field
                            defaultPhoneNumberField(
                              context: context,
                              controller: phoneController,
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value.toString().isEmpty) {
                                  return 'Please enter mobile number';
                                } else if (!regExp.hasMatch(value.toString())) {
                                  return 'Please enter valid mobile number';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedCountryCode =
                                      value.completeNumber.toString();
                                });
                              },
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            // 2- Make Password Field
                            defaultTextFeild(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              isPassword: getCubit.isPassword,
                              labelText: "${getLang(context, "password")}",
                              suffix: getCubit.isPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility_sharp,
                              onTapSuffixIconFunction: () {
                                setState(() {
                                  getCubit.isPasswordShown();
                                });
                              },
                              submitFunction: (String? value) {
                                return value;
                              },
                              validFunction: (String? value) {
                                if (value!.isEmpty) {
                                  return "${getLang(context, "password_empty")}";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      // 3- Forget Password
                      Container(
                        padding: const EdgeInsetsDirectional.only(end: 22),
                        alignment: AlignmentDirectional.centerEnd,
                        child: defaultTextButton(
                          text: "${getLang(context, "forget_password")}",
                          textColor: const Color(0XFFE44544).withOpacity(0.5),
                          decoration: TextDecoration.none,
                          textFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      // 4- Rememberr Check Box
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 30,
                          end: 30,
                          bottom: 30,
                        ),
                        child: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 20.0,
                                  width: 20.0,
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0XFF43494B)),
                                    child: Checkbox(
                                      activeColor: const Color(0XFF43494B),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              textPoppinsRegular(
                                text: "${getLang(context, "remember_me")}",
                                fontSize: 14,
                                textColor: const Color(0xff646464),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 5- Sign InButton
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            buttonText: "${getLang(context, "login")}",
                            onTapFunction: (() async {
                              if (formKey.currentState!.validate()) {
                                print(phoneController.text);
                                final connectivityResult =
                                    await Connectivity().checkConnectivity();
                                if (connectivityResult ==
                                    ConnectivityResult.none) {
                                  Fluttertoast.showToast(
                                      msg: "no internet",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black45,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  getCubit.userLogin(
                                    phone: selectedCountryCode,
                                    password: passwordController.text,
                                  );
                                }
                              }
                            }),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(
                                color: Color(0XFFE44544)),
                          ),
                        ),
                      ),
                      // 6- Sign In Text Button
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textPoppinsRegular(
                              text: "${getLang(context, "have_not_account")}",
                              fontSize: 14),
                          defaultTextButton(
                            text: "${getLang(context, "signup")}",
                            textFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
