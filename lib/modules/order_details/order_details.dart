// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../../shared/components/components.dart';
import '../google_maps/google_maps.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  double _value = 2.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              // App Bar
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 6,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
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
                    top: 25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 30, end: 40, top: 30),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GoogleMapScreen(),
                                ));
                          },
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              width: 80,
                              height: 80,
                              image: AssetImage(
                                'assets/order-request.png',
                              ),
                            ),
                            textPoppinsRegular(
                              text: 'Restaurant Name',
                              fontSize: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  const Image(
                                    width: 25,
                                    height: 25,
                                    image: AssetImage(
                                      'assets/order-location.PNG',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: textPoppinsRegular(
                                      text: '30 Nasouh St-Gaddah',
                                      fontSize: 15,
                                      textColor: const Color(0XFF43494B)
                                          .withOpacity(.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              starOffColor: const Color(0xffe7e8ea),
                              starColor: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Body
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Stack(
                      // alignment: Alignment.center,
                      children: [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Client Info
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 345,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0XFF70707099),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Name
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(
                                              start: 15,
                                              bottom: 10,
                                            ),
                                            child: textPoppinsMedium(
                                              text: 'Client Name',
                                              fontSize: 20,
                                              textColor:
                                                  const Color(0XFF43494B),
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              // Rate
                                              textPoppinsRegular(
                                                text: '4.8',
                                                fontSize: 18,
                                              ),
                                              // Rate Icon
                                              Icon(Icons.star,
                                                  size: 18,
                                                  color: Colors.yellow,
                                                  shadows: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade400,
                                                      blurRadius: 6,
                                                      blurStyle:
                                                          BlurStyle.outer,
                                                    ),
                                                  ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // Client Image
                                          const Image(
                                            width: 80,
                                            height: 80,
                                            image: AssetImage(
                                              'assets/drawer.png',
                                            ),
                                          ),
                                          // Client Info
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .only(start: 5),
                                                  child: textPoppinsRegular(
                                                    text: 'Ahmed Mohamed',
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Image(
                                                        width: 25,
                                                        height: 25,
                                                        image: AssetImage(
                                                          'assets/order-location.PNG',
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            textPoppinsRegular(
                                                          maxLines: 2,
                                                          text:
                                                              'Ezbet El-Arab,Nasr City, Cairo Governorate 4433261',
                                                          fontSize: 15,
                                                          textColor: const Color(
                                                                  0XFF43494B)
                                                              .withOpacity(.6),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Order Info
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 10, start: 20),
                                    width: 345,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0XFF70707099),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Order ID
                                        textPoppinsMedium(
                                          text: 'Order #4566333773838',
                                          fontSize: 20,
                                          textColor: const Color(0XFF43494B),
                                        ),
                                        // Order Date
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: textPoppinsRegular(
                                            text: 'Placed on 24 Dec , 2020',
                                            fontSize: 18,
                                            textColor: const Color(0XFF43494B)
                                                .withOpacity(.6),
                                          ),
                                        ),
                                        // Num Of Items
                                        Column(
                                          children: [
                                            textPoppinsRegular(
                                              text: 'No. of Items : 3',
                                              fontSize: 18,
                                              textColor: const Color(0XFF43494B)
                                                  .withOpacity(.6),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Order Items
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 10),
                                child: textPoppinsMedium(
                                  text: 'Order Items',
                                  fontSize: 20,
                                  textColor: const Color(0XFF43494B),
                                ),
                              ),
                              // Items Details
                              Center(
                                child: Wrap(
                                  runSpacing: 10,
                                  children: List.generate(
                                      3,
                                      (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              width: 345,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade400,
                                                    blurRadius: 6,
                                                    blurStyle: BlurStyle.outer,
                                                  ),
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Image(
                                                    image: AssetImage(
                                                        'assets/order.PNG'),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .only(start: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          textPoppinsRegular(
                                                            text: 'Bread',
                                                            fontSize: 18,
                                                            textColor:
                                                                const Color(
                                                                    0XFF43494B),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              textPoppinsRegular(
                                                                text: '4 pices',
                                                                fontSize: 15,
                                                                textColor: const Color(
                                                                        0XFF43494B)
                                                                    .withOpacity(
                                                                        .61),
                                                              ),
                                                              const Spacer(),
                                                              textPoppinsRegular(
                                                                text: '5 SAR',
                                                                fontSize: 15,
                                                                textColor:
                                                                    const Color(
                                                                        0XFFE44544),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      growable: true),
                                ),
                              ),
                              // Order Summary
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 10,
                                ),
                                child: textPoppinsMedium(
                                  text: 'Order Summary',
                                  fontSize: 20,
                                  textColor: const Color(0XFF43494B),
                                ),
                              ),
                              // Order Summary Details
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10, end: 10, bottom: 20),
                                child: Column(
                                  children: [
                                    // Subtotal
                                    Row(
                                      children: [
                                        textPoppinsRegular(
                                          text: 'Subtotal 3 Items',
                                          fontSize: 20,
                                          textColor: const Color(0XFF43494B),
                                        ),
                                        const Spacer(),
                                        textPoppinsRegular(
                                          text: '30 SAR',
                                          fontSize: 20,
                                          textColor: const Color(0XFF43494B),
                                        ),
                                      ],
                                    ),
                                    // Shipping Fees
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(
                                        children: [
                                          textPoppinsRegular(
                                            text: 'Shipping Fees',
                                            fontSize: 20,
                                            textColor: const Color(0XFF43494B),
                                          ),
                                          const Spacer(),
                                          textPoppinsRegular(
                                            text: '10 SAR',
                                            fontSize: 20,
                                            textColor: const Color(0XFF43494B),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Total
                                    Row(
                                      children: [
                                        textPoppinsMedium(
                                          text: 'Total',
                                          fontSize: 20,
                                          textColor: const Color(0XFF43494B),
                                        ),
                                        const Spacer(),
                                        textPoppinsMedium(
                                          text: '40 SAR',
                                          fontSize: 20,
                                          textColor: const Color(0XFF43494B),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Accept Button
          Container(
            width: 380,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0XFF80AF50),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  32,
                ),
              ),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GoogleMapScreen(),
                    ));
              },
              child: textPoppinsRegular(
                  text: 'Accept', fontSize: 18, textColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
