// ignore_for_file: must_be_immutable

import 'package:driver_app/modules/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import '../../shared/components/app_localization.dart';
import '../../shared/components/components.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey();
  var phoneController = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1- Forget Password Container
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
                    text: "${getLang(context, "forget_password2")}",
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textPoppinsRegular(
                    text: "${getLang(context, "phone_number_text1")}",
                    fontSize: 18,
                    textColor: const Color(0XFF43494B).withOpacity(0.76),
                  ),
                  textPoppinsRegular(
                    text: "${getLang(context, "phone_number_text2")}",
                    fontSize: 18,
                    textColor: const Color(0XFF43494B).withOpacity(0.76),
                  ),
                  // 3- Phone Number Form
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 45,
                      horizontal: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 4.1 Phone Number Text
                        textPoppinsRegular(
                          text: "${getLang(context, "phone_number")}",
                          fontSize: 18,
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
                            }),
                      ],
                    ),
                  ),
                  // 5- Next Button
                  Center(
                    child: defaultButton(
                        buttonText: "${getLang(context, "next")}",
                        onTapFunction: (() {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen(),
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
  }
}
