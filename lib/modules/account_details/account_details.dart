// ignore_for_file: unused_field, avoid_print, unnecessary_this, deprecated_member_use

import 'dart:io';
import 'package:driver_app/modules/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/components/components.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  List list = [];

  File? _image;
  Future imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
    list.add(image.path);
    print(list);
  }

  File? imageFile;
  imageFromCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 200, maxWidth: 200);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
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

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              builder: (context) => const SettingScreen(),
                            ));
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    textPoppinsRegular(
                      text: 'Account Details',
                      textColor: Colors.white,
                      fontSize: 30,
                    ),
                  ],
                ),
              ),
            ),
            // Change Profile Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/drawer.png'),
                    radius: 80,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(bottom: 10, end: 15),
                    child: InkWell(
                      onTap: () {
                        pickedImage();
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0XFFE44544),
                        child: Image(
                          width: 25,
                          height: 25,
                          image: AssetImage('assets/camera.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Data
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
                  // Name
                  textPoppinsRegular(
                    text: 'Full Name',
                    fontSize: 18,
                    textColor: const Color(0XFF43494B).withOpacity(.6),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Name Form Feild
                  Row(
                    children: [
                      SizedBox(
                        width: 310,
                        child: defaultTextFeild(
                          enabled: enabled,
                          hintText: 'Mostafa Mohamed',
                          controller: nameController,
                          type: TextInputType.visiblePassword,
                          submitFunction: (String? value) {
                            return value;
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            enabled = true;
                          });
                        },
                        icon: const Image(
                          image: AssetImage(
                            'assets/edit.PNG',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //  Phone Number Text
                  textPoppinsRegular(
                    text: 'Phone Number',
                    fontSize: 18,
                    textColor: const Color(0XFF43494B).withOpacity(.6),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Phone Number Field
                  Row(
                    children: [
                      SizedBox(
                        width: 310,
                        child: defaultPhoneNumberField(
                            enabled: enabled,
                            hintText: '01091993084',                                                                                               
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
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            enabled = true;
                          });
                        },
                        icon: const Image(
                          image: AssetImage(
                            'assets/edit.PNG',
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Save Button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Center(
                        child: defaultButton(
                            buttonText: 'Save', onTapFunction: () {})),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
