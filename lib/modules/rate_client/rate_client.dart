import 'package:driver_app/modules/google_maps/google_maps.dart';
import 'package:driver_app/modules/new_orders/new_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../../shared/components/components.dart';

class RateClientScreen extends StatefulWidget {
  const RateClientScreen({Key? key}) : super(key: key);

  @override
  State<RateClientScreen> createState() => _RateClientScreenState();
}

class _RateClientScreenState extends State<RateClientScreen> {
  double _value = 3.5;
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
                            builder: (context) => const GoogleMapScreen(),
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  textPoppinsRegular(
                    text: 'Rate Client',
                    textColor: Colors.white,
                    fontSize: 30,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Column(
              children: [
                textPoppinsMedium(
                  text: 'Tap the stars to choose your rate',
                  textColor: const Color(0XFF43494B),
                  fontSize: 20,
                ),
                // 3- Rating
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 35,
                  ),
                  child: RatingStars(
                    value: _value,
                    onValueChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                      size: 35,
                    ),
                    starCount: 5,
                    starSize: 35,
                    maxValue: 5,
                    starSpacing: 2,
                    maxValueVisibility: true,
                    valueLabelVisibility: false,
                    animationDuration: const Duration(milliseconds: 1000),
                    starOffColor: const Color(0xffe7e8ea),
                    starColor: const Color(0XFFF1CD51),
                  ),
                ),

                SizedBox(
                  width: 345,
                  height: 89,
                  child: TextField(
                    maxLines: 10,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: 'Client didn\'t receive the order',
                      hintStyle: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 12,
                        color: const Color(0XFF43494B).withOpacity(.6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 1,
                          color: const Color(0XFF43494B).withOpacity(.29),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 1,
                          color: const Color(0XFF43494B).withOpacity(.29),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: defaultButton(
                    height: 63,
                    width: 303,
                    buttonText: 'Submit Review',
                    onTapFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewOrderScreen(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
