// ignore_for_file: avoid_print

import 'package:driver_app/modules/signup_screen/upload_attatchments/national_id/national_id_front.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../../../shared/components/app_localization.dart';

class UploadAttatchmentStartScreen extends StatefulWidget {
  const UploadAttatchmentStartScreen({Key? key}) : super(key: key);

  @override
  UploadAttatchmentStartScreenState createState() =>
      UploadAttatchmentStartScreenState();
}

class UploadAttatchmentStartScreenState
    extends State<UploadAttatchmentStartScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final pageController = PageController();

  final List<int> steps = [
    1,
    2,
  ];

  @override
  Widget build(BuildContext context) {
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
                // 1- Making Signup Container
                appBarContainer(text: ''),
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
                                color: Color(0xFF80AF50),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      // 1- Text
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textPoppinsMedium(
                          text: "${getLang(context, "welcome_name")}",
                          fontSize: 25,
                          textColor: const Color(0XFF43494B),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textPoppinsRegular(
                          text: "${getLang(context, "first_text")}",
                          fontSize: 18,
                          textColor: const Color(0XFF43494B).withOpacity(0.76),
                        ),
                        textPoppinsRegular(
                          text: "${getLang(context, "second_text")}",
                          fontSize: 18,
                          textColor: const Color(0XFF43494B).withOpacity(0.76),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // 2- Needed Attatchment
                        Column(
                          children: [
                            // 2.1- National ID
                            Row(
                              children: [
                                const Image(
                                  width: 30,
                                  height: 30,
                                  image: AssetImage(
                                    'assets/id-card.PNG',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                textPoppinsRegular(
                                  text: "${getLang(context, "national_id")}",
                                  fontSize: 20,
                                  textColor:
                                      const Color(0XFF43494B).withOpacity(0.76),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // 2.2- Driver Lisence
                            Row(
                              children: [
                                const Image(
                                  width: 30,
                                  height: 30,
                                  image: AssetImage(
                                    'assets/id-card.PNG',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                textPoppinsRegular(
                                  text: "${getLang(context, "driver_lisence")}",
                                  fontSize: 20,
                                  textColor:
                                      const Color(0XFF43494B).withOpacity(0.76),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // 2.3- Vehcile Lisence
                            Row(
                              children: [
                                const Image(
                                  width: 30,
                                  height: 30,
                                  image: AssetImage(
                                    'assets/id-card.PNG',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                textPoppinsRegular(
                                  text:
                                      "${getLang(context, "vehcile_lisence")}",
                                  fontSize: 20,
                                  textColor:
                                      const Color(0XFF43494B).withOpacity(0.76),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // 3- Start Text Button
                        const Spacer(),
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                            bottom: 30,
                            end: 10,
                          ),
                          alignment: AlignmentDirectional.bottomEnd,
                          child: defaultTextButton(
                            text: "${getLang(context, "start")}",
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            textFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const UploadNationalIdFrontScreen()),
                                ),
                              );
                            },
                          ),
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
