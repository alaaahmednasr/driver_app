// ignore_for_file: avoid_print, unused_field, unnecessary_this, deprecated_member_use

import 'dart:io';
import 'package:driver_app/shared/components/components.dart';
import 'package:driver_app/shared/components/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/components/app_localization.dart';
import 'driver_lisence_back.dart';

class UploadDriverLisenceFrontScreen extends StatefulWidget {
  const UploadDriverLisenceFrontScreen({Key? key}) : super(key: key);

  @override
  UploadDriverLisenceFrontScreenState createState() =>
      UploadDriverLisenceFrontScreenState();
}

class UploadDriverLisenceFrontScreenState
    extends State<UploadDriverLisenceFrontScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final pageController = PageController();

  File? image;
  // Get Image From Gallery
  Future imageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  // Get Image From Camera
  Future imageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  void pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          title: Center(
            child: textPoppinsMedium(
              text: "Choose Image Source",
              textColor: const Color(0XFF43494B),
              fontSize: 20,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: const EdgeInsets.symmetric(vertical: 30),
          actions: [
            FlatButton(
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/photo-camera.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  textPoppinsMedium(
                    text: "Camera",
                    textColor: const Color(0XFF43494B),
                    fontSize: 18,
                  ),
                ],
              ),
              onPressed: () => imageFromCamera(),
            ),
            FlatButton(
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/image.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  textPoppinsMedium(
                    text: "Gallery",
                    textColor: const Color(0XFF43494B),
                    fontSize: 18,
                  ),
                ],
              ),
              onPressed: () => imageFromGallery(),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SizedBox(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1- Making Signup Container
              secoundaryAppBarContainer(onPressed: (() {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const UploadNationalIdScreen(),
                //     ));
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

              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    // 1- Text
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textPoppinsMedium(
                        text: "${getLang(context, "driver_lisence")}",
                        fontSize: 25,
                        textColor: const Color(0XFF43494B),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textPoppinsRegular(
                        text: "${getLang(context, "front")}",
                        fontSize: 18,
                        textColor: const Color(0XFF43494B).withOpacity(0.76),
                      ),
                      textPoppinsRegular(
                        text: "${getLang(context, "drive_id")}",
                        fontSize: 18,
                        textColor: const Color(0XFF43494B).withOpacity(0.76),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // 2- Attatchment Image
                      Center(
                        child: Image(
                            width: 130,
                            height: 130,
                            image: image == null
                                ? const AssetImage(
                                    'assets/ID.PNG',
                                  )
                                : FileImage(image!) as ImageProvider),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // 3- Camera Button
                      Center(
                        child: secondaryButton(
                          onTapFunction: () {
                            pickedImage();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 4- Upload Text
                      Center(
                        child: textPoppinsRegular(
                          text: "${getLang(context, "upload_photo")}",
                          fontSize: 18,
                          textColor: const Color(0XFFE44544),
                        ),
                      ),
                      // 5- Next Text Button
                      const Spacer(),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                          bottom: 30,
                          end: 10,
                        ),
                        alignment: AlignmentDirectional.bottomEnd,
                        child: defaultTextButton(
                          text: "${getLang(context, "next")}",
                          fontSize: 25,
                          decoration: TextDecoration.none,
                          textFunction: () {
                            driverLisenceFront = image?.path;

                            print('***********************');
                            print(driverLisenceFront);
                            print('***********************');
                            if (driverLisenceFront == null) {
                              Fluttertoast.showToast(
                                  msg: "${getLang(context, "image")}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black45,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const UploadDriverLisenceBackScreen()),
                                ),
                              );
                            }
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
    );
  }
}
