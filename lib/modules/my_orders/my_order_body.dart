import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../shared/components/components.dart';

class MyOrderBody extends StatefulWidget {
  const MyOrderBody({Key? key}) : super(key: key);

  @override
  State<MyOrderBody> createState() => _MyOrderBodyState();
}

class _MyOrderBodyState extends State<MyOrderBody> {
  double _value = 3.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 30),
      child: Column(
        children: [
          Container(
            width: 345,
            height: 97,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Person Photo
                  const Image(
                    width: 80,
                    height: 80,
                    image: AssetImage('assets/drawer.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 1- Name
                        textPoppinsRegular(
                          text: 'Ahmed Mohamed',
                          fontSize: 18,
                        ),
                        // 2- Address
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: textPoppinsRegular(
                            text: '12 Nasr St.-Maddi',
                            fontSize: 14,
                            textColor: const Color(0XFF43494B).withOpacity(0.6),
                          ),
                        ),
                        // 3- Rating
                        RatingStars(
                          value: _value,
                          onValueChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                          starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                            size: 18,
                          ),
                          starCount: 5,
                          starSize: 20,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: true,
                          valueLabelVisibility: false,
                          animationDuration: const Duration(milliseconds: 1000),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 9),
                    child: textPoppinsMedium(
                      text: '40 SAR',
                      fontSize: 20,
                      textColor: const Color(0XFF43494B),
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
