// ignore_for_file: unused_local_variable, unused_field, unnecessary_nullable_for_final_variable_declarations

import 'package:driver_app/modules/change_password/change_password.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../account_details/account_details.dart';
import '../new_orders/new_order.dart';
import 'local_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

// ignore: constant_identifier_names
enum SingingCharacter { English, Arabic }

class _SettingScreenState extends State<SettingScreen> {
  bool switchValue = true;
  bool isEnglish = true;
  bool isArabic = true;
  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                            builder: (context) => const NewOrderScreen(),
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  textPoppinsRegular(
                    text: 'Settings',
                    textColor: Colors.white,
                    fontSize: 30,
                  ),
                ],
              ),
            ),
          ),
          // Acount Details
          InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountDetailsScreen(),
                  ));
            }),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 30, start: 30, end: 30),
              child: Row(
                children: [
                  const Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(
                      'assets/account.PNG',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPoppinsMedium(
                      text: 'Account Details',
                      textColor: const Color(0XFF43494B),
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Change Password
          InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ));
            }),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 20, start: 30, end: 30),
              child: Row(
                children: [
                  const Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(
                      'assets/pass.PNG',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPoppinsMedium(
                      text: 'Change Password',
                      textColor: const Color(0XFF43494B),
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Notification
          InkWell(
            onTap: (() {}),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 20,
                start: 30,
                end: 30,
              ),
              child: Row(
                children: [
                  const Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(
                      'assets/setting_notify.PNG',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPoppinsMedium(
                      text: 'Notification',
                      textColor: const Color(0XFF43494B),
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0XFFE44544),
                  ),
                ],
              ),
            ),
          ),
          // Language

          InkWell(
            onTap: (() {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          title: Center(
                            child: textPoppinsMedium(
                              text: "Change Language",
                              textColor: const Color(0XFF43494B),
                              fontSize: 20,
                            ),
                          ),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 10,
                                  start: 20,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    RadioListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      title: textPoppinsRegular(
                                        text: "English",
                                        textColor: const Color(0XFF43494B),
                                        fontSize: 18,
                                      ),
                                      activeColor: const Color(0XFFE44544),
                                      value: "en",
                                      groupValue: language,
                                      onChanged: (String? value) {
                                        setState(() {
                                          language = value.toString();
                                        });
                                        if (value != null) {
                                          context.read<LocalCubit>().changeLanguage(value);
                                        }
                                      },
                                    ),
                                    RadioListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      title: textPoppinsRegular(
                                        text: "Arabic",
                                        textColor: const Color(0XFF43494B),
                                        fontSize: 18,
                                      ),
                                      activeColor: const Color(0XFFE44544),
                                      value: "ar",
                                      groupValue: language,
                                      onChanged: (String? value) {
                                        setState(() {
                                          language = value.toString();
                                        });
                                        if (value != null) {
                                          context.read<LocalCubit>().changeLanguage(value);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  });
            }),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 20, start: 30, end: 30),
              child: Row(
                children: [
                  const Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(
                      'assets/lang.PNG',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: textPoppinsMedium(
                      text: 'Language',
                      textColor: const Color(0XFF43494B),
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
