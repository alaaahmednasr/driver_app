// ignore_for_file: must_be_immutable

import 'package:driver_app/modules/new_orders/cubit/order_cubit.dart';
import 'package:driver_app/modules/new_orders/cubit/order_states.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../google_maps/google_maps.dart';

class OrderRequestBody extends StatefulWidget {
  String? resturantName;
  String? total;

  OrderRequestBody({Key? key, this.resturantName, this.total})
      : super(key: key);

  @override
  State<OrderRequestBody> createState() => _OrderRequestBodyState();
}

class _OrderRequestBodyState extends State<OrderRequestBody> {
  double _value = 2.5;
  // String? name = widget.resturantName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is! OrderScusessState) {
          return const SizedBox();
        } else {
          return SizedBox(
            width: 180,
            height: 255,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 30),
                    width: 180,
                    height: 220,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 6,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textPoppinsRegular(
                          text: widget.resturantName!,
                          fontSize: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
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
                              size: 18,
                            ),
                            starCount: 5,
                            starSize: 20,
                            maxValue: 5,
                            starSpacing: 2,
                            maxValueVisibility: true,
                            valueLabelVisibility: false,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            starOffColor: const Color(0xffe7e8ea),
                            starColor: Colors.yellow,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: textPoppinsRegular(
                            text: ',Ezbet El-Arab,Nasr City,',
                            fontSize: 13,
                            textColor: const Color(0XFF00BFFF),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: textPoppinsRegular(
                            text: 'Cairo Governorate 4433261',
                            fontSize: 13,
                            textColor: const Color(0XFF00BFFF),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textPoppinsBold(
                                text: widget.total!,
                                fontSize: 18,
                                textColor: const Color(0XFFE44544),
                              ),
                              textPoppinsBold(
                                text: ' SAR ',
                                fontSize: 18,
                                textColor: const Color(0XFFE44544),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(bottom: 10),
                          child: Container(
                            width: 144,
                            height: 19,
                            decoration: const BoxDecoration(
                              color: Color(0XFF80AF50),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const GoogleMapScreen(),
                                  ),
                                );
                              },
                              child: textPoppinsRegular(
                                text: 'Accept',
                                fontSize: 15,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage(
                      'assets/order-request.png',
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
