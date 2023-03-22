// ignore_for_file: avoid_print

import 'package:driver_app/modules/signup_screen/vertification/vertification.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:driver_app/shared/components/global_variables.dart';
import 'package:flutter/material.dart';
import '../../../shared/components/app_localization.dart';
import '../../login_screen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  var phoneController = TextEditingController();
  final pageController = PageController();

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                  // 3- Head Text
                  Center(
                    child: textPoppinsRegular(
                      text: "${getLang(context, "create_account")}",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // 3- Enter Phone Number Text
                  Center(
                    child: textPoppinsRegular(
                      text: "${getLang(context, "phone_number_text1")}",
                      fontSize: 18,
                      textColor: const Color(0XFF43494B).withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: textPoppinsRegular(
                      text: "${getLang(context, "phone_number_text2")}",
                      fontSize: 18,
                      textColor: const Color(0XFF43494B).withOpacity(0.8),
                    ),
                  ),
                  // 4- Phone Number Form
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 40.0,
                      start: 30,
                      end: 30,
                      bottom: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 4.1 Phone Number Text
                        textPoppinsRegular(
                          text: "${getLang(context, "phone_number")}",
                          fontSize: 18,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // 4.1 Phone Number Field
                        defaultPhoneNumberField(
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
                              phoneNumber = value.completeNumber.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // 5- OTP Button
                  Center(
                    child: defaultButton(
                        buttonText: "${getLang(context, "phone_otp")}",
                        onTapFunction: (() {
                          if (formKey.currentState!.validate()) {
                            print(phoneNumber);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VertificationScreen(),
                              ),
                            );
                          }
                        })),
                  ),
                  const Spacer(),
                  // 6- Sign in text button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textPoppinsRegular(
                            text: "${getLang(context, "have_account")}",
                            fontSize: 12),
                        defaultTextButton(
                          text: "${getLang(context, "signin")}",
                          textFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
