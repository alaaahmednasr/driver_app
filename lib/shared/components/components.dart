// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'app_localization.dart';

// Default Button
Widget defaultButton({
  Color buttonColor = const Color(0XFFE44544),
  Color textColor = Colors.white,
  String fontFamily = 'PoppinsRegular',
  double fontSize = 20,
  required String buttonText,
  required void Function()? onTapFunction,
  double width = 303,
  double height = 63,
  double radius = 32,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
      ),
      child: MaterialButton(
        onPressed: onTapFunction,
        child: textPoppinsRegular(
          text: buttonText,
          fontSize: fontSize,
          textColor: textColor,
        ),
      ),
    );

// Secondary Button
Widget secondaryButton({
  Color buttonColor = const Color(0XFFE44544),
  required void Function()? onTapFunction,
  double width = 303,
  double height = 63,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            32,
          ),
        ),
      ),
      child: MaterialButton(
        onPressed: onTapFunction,
        child: const Image(
          image: AssetImage(
            'assets/camera.png',
          ),
        ),
      ),
    );

// Text Poppins Regular Font
Widget textPoppinsRegular({
  required String text,
  double fontSize = 35,
  Color textColor = const Color(0XFF43494B),
  TextDecoration decoration = TextDecoration.none,
  int? maxLines,
  TextOverflow? textOverflow,
}) =>
    Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontSize: fontSize,
        color: textColor,
        decoration: decoration,
      ),
    );

// Text Poppins Bold Font
Widget textPoppinsBold({
  required String text,
  double fontSize = 20,
  Color textColor = Colors.white,
}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: 'PoppinsBold',
        fontSize: fontSize,
        color: textColor,
      ),
    );

// Text Poppins Medium Font
Widget textPoppinsMedium({
  required String text,
  double fontSize = 35,
  Color textColor = Colors.white,
}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: 'PoppinsMedium',
        fontSize: fontSize,
        color: textColor,
      ),
    );

// App Bar Container
Widget appBarContainer({
  String? text,
  double height = 180,
}) =>
    Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: height,
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
          bottom: 25,
        ),
        child: textPoppinsRegular(
          text: text!,
          fontSize: 40,
          textColor: Colors.white,
        ),
      ),
    );

// Secoundary App Bar Container
Widget secoundaryAppBarContainer({
  double height = 180,
  required void Function()? onPressed,
}) =>
    Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: height,
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
          bottom: 25,
          start: 30,
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.white,
              ),
              onPressed: onPressed,
            ),
            // textPoppinsRegular(text: text!),
          ],
        ),
      ),
    );

// Text Form Feild For auth
Widget defaultTextFeild({
  required TextEditingController controller,
  required TextInputType type,
  String? labelText,
  String? Function(String?)? submitFunction,
  String? Function(String?)? validFunction,
  void Function()? onTapFunction,
  void Function()? onTapSuffixIconFunction,
  Color suffixIconColor = const Color(0xFF707070),
  IconData? suffix,
  IconData? prefix,
  bool isPassword = false,
  String hintText = '',
  bool enabled = true,
}) =>
    TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: submitFunction,
      validator: validFunction,
      obscureText: isPassword,
      onTap: onTapFunction,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'PoppinsMedium',
          // fontSize: fontSize,
          color: Color(0XFF43494B),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: onTapSuffixIconFunction,
                icon: Icon(
                  suffix,
                  color: suffixIconColor,
                ),
              )
            : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF707070),
            width: 2,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red[400],
          backgroundColor: const Color(0xFFf5c6c0),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        labelStyle: const TextStyle(
          color: Color(0xFF6D6A6A),
          fontFamily: 'Poppins',
          fontSize: 15,
        ),
      ),
      cursorColor: Colors.black,
    );

// Phone Number Form Feild
Widget defaultPhoneNumberField({
  required TextEditingController controller,
  required FutureOr<String?> Function(PhoneNumber?)? validator,
  Color suffixIconColor = const Color(0xFF707070),
  void Function()? onTapSuffixIconFunction,
  void Function(PhoneNumber)? onChanged,
  IconData? suffix,
  String hintText = '',
  bool enabled = true,
  BuildContext? context,
}) =>
    IntlPhoneField(
      enabled: enabled,
      validator: validator,
      controller: controller,
      cursorColor: Colors.black,
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: Color(0xFF707070),
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onTapSuffixIconFunction,
          icon: Icon(
            suffix,
            color: suffixIconColor,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'PoppinsMedium',
          color: Color(0XFF43494B),
        ),
        alignLabelWithHint: true,
        contentPadding: const EdgeInsetsDirectional.only(
          top: 13.5,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF707070),
            width: 2,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red[400],
          backgroundColor: const Color(0xFFf5c6c0),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        // errorText: "${getLang(context!, "error_text")}",
        labelStyle: const TextStyle(
          color: Color(0xFF6D6A6A),
          fontFamily: 'Poppins',
          fontSize: 15,
        ),
      ),
      initialCountryCode: 'SA',
      onChanged: onChanged,
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
      onSubmitted: ((value) {
        print(controller.text);
      }),
      onSaved: (newValue) {
        print(newValue!.completeNumber);
      },
      keyboardType: TextInputType.phone,
    );

// Text Button
Widget defaultTextButton({
  required String text,
  required void Function() textFunction,
  double fontSize = 14,
  TextDecoration decoration = TextDecoration.underline,
  Color textColor = const Color(0XFFE44544),
}) =>
    TextButton(
        onPressed: textFunction,
        child: textPoppinsRegular(
          text: text,
          fontSize: fontSize,
          textColor: textColor,
          decoration: decoration,
        ));

// Wallet Body
Widget WalletBody() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const Image(
                width: 50,
                height: 50,
                image: AssetImage(
                  'assets/market.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              textPoppinsMedium(
                text: 'Morning Market',
                textColor: const Color(0XFF43494B),
                fontSize: 20,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 5, end: 5),
                child: Column(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Color(0xFFE44544),
                      size: 16.0,
                    ),
                    Dash(
                      direction: Axis.vertical,
                      length: 45,
                      dashLength: 5,
                      dashColor: Colors.grey,
                    ),
                    Icon(
                      Icons.circle,
                      color: Color(0xFF80AF50),
                      size: 16.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textPoppinsRegular(
                          text: 'Zone Cash',
                          fontSize: 20,
                        ),
                        const Spacer(),
                        textPoppinsRegular(
                          text: '-SAR 150',
                          fontSize: 18,
                          textColor: const Color(0XFFE44544),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: textPoppinsRegular(
                        text: 'April 15',
                        fontSize: 14,
                        textColor: const Color(0XFF43494B).withOpacity(.6),
                      ),
                    ),
                    Row(
                      children: [
                        textPoppinsRegular(
                            text: 'Change Recieved', fontSize: 20),
                        const Spacer(),
                        textPoppinsRegular(
                          text: 'SAR 200',
                          fontSize: 18,
                          textColor: const Color(0XFF43494B).withOpacity(.8),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: textPoppinsRegular(
                        text: 'April 15',
                        fontSize: 14,
                        textColor: const Color(0XFF43494B).withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

// Stepper content
Widget StepperContent(context) => Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 60, start: 35, end: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textPoppinsRegular(
            text: "${getLang(context, "basic_data")}",
            fontSize: 12,
            textColor: const Color(0XFF43494B).withOpacity(.6),
          ),
          textPoppinsRegular(
            text: "${getLang(context, "vertification")}",
            fontSize: 12,
            textColor: const Color(0XFF43494B).withOpacity(.6),
          ),
          Column(
            children: [
              textPoppinsRegular(
                text: "${getLang(context, "upload")}",
                fontSize: 12,
                textColor: const Color(0XFF43494B).withOpacity(.6),
              ),
              textPoppinsRegular(
                text: "${getLang(context, "attatchments")}",
                fontSize: 12,
                textColor: const Color(0XFF43494B).withOpacity(.6),
              ),
            ],
          ),
        ],
      ),
    );
