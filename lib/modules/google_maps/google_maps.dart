import 'dart:collection';

import 'package:driver_app/modules/rate_client/rate_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login_screen/login_screen.dart';
import '../my_orders/my_order.dart';
import '../new_orders/new_order.dart';
import '../notifications/notifications.dart';
import '../order_details/order_details.dart';
import '../settings/settings.dart';
import '../terms_conditions/terms_conditions.dart';
import '../wallet/wallet.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  bool isPickedUp = false;
  double _value = 3.5;
  bool switchValue = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var markers = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              // 1- Image
              const Image(
                width: 150,
                height: 150,
                image: AssetImage(
                  'assets/drawer.png',
                ),
              ),
              // 2- Name
              textPoppinsRegular(
                text: 'Mohamed Mostafa',
                fontSize: 22,
              ),
              // 3- Rating
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
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
                  animationDuration: const Duration(milliseconds: 1000),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Colors.yellow,
                ),
              ),
              // 4- List
              // 4.1- Active
              ListTile(
                title: textPoppinsRegular(
                  text: 'Active',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/active.PNG',
                  ),
                ),
                trailing: Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0XFF80AF50),
                ),
                onTap: (() {}),
              ),
              // 4.2- New Order
              ListTile(
                title: textPoppinsRegular(
                  text: 'New Orders',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/new-order.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewOrderScreen(),
                      ));
                }),
              ),
              // 4.3-  My Order
              ListTile(
                title: textPoppinsRegular(
                  text: 'My Orders',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/my-order.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyOrderScreen(),
                      ));
                }),
              ),
              // 4.4 - Notifications
              ListTile(
                title: textPoppinsRegular(
                  text: 'Notifications',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/notification.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ));
                }),
              ),
              // 4.5- Wallet
              ListTile(
                title: textPoppinsRegular(
                  text: 'Wallet',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/wallet.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WalletScreen(),
                      ));
                }),
              ),
              // 4.6- Settings
              ListTile(
                title: textPoppinsRegular(
                  text: 'Settings',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/settings.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingScreen(),
                      ));
                }),
              ),
              // 4.7- Terms & Conditions
              ListTile(
                title: textPoppinsRegular(
                  text: 'Terms & Conditions',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/terms.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsAndConditions(),
                      ));
                }),
              ),
              // 4.8- Chat
              ListTile(
                title: textPoppinsRegular(
                  text: 'Chat With Us',
                  fontSize: 20,
                ),
                leading: const Image(
                  width: 35,
                  height: 35,
                  image: AssetImage(
                    'assets/whatsapp.PNG',
                  ),
                ),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDetailsScreen(),
                      ));
                }),
              ),
              const Spacer(),
              // 4.9- logout
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 10),
                child: ListTile(
                  title: textPoppinsRegular(
                    text: 'Logout',
                    fontSize: 20,
                  ),
                  leading: const Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(
                      'assets/logout.PNG',
                    ),
                  ),
                  onTap: (() {
                    CacheHelper.removeData(key: 'token').then((value) {
                    if (value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const LoginScreen(),
                          ),
                          (route) => false);
                    }}
                  );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Map
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(
                30.0444,
                31.2357,
              ),
              zoom: 14,
            ),
            onMapCreated: (GoogleMapController googleMapController) {
              setState(() {
                markers.add(
                  const Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(
                        30.0444,
                        31.2357,
                      )),
                );
              });
            },
            markers: markers,
          ),
          // Drawer And Requested Orders
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 10, top: 40, end: 10),
            child: Row(
              children: [
                // Drawer
                InkWell(
                  onTap: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Image(
                    width: 70,
                    height: 70,
                    image: AssetImage(
                      'assets/drawer.png',
                    ),
                  ),
                ),
                const Spacer(),
                // Requested Orders
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewOrderScreen(),
                        ));
                  }),
                  child: const Image(
                    width: 55,
                    height: 55,
                    image: AssetImage(
                      'assets/shopping-bag.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          isPickedUp
              ?
              // Is Picked
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                          top: 90,
                          start: 20,
                          end: 20,
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 350,
                        decoration: const BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Total order
                            Row(
                              children: [
                                const Image(
                                  width: 40,
                                  height: 40,
                                  image: AssetImage(
                                    'assets/total-order.PNG',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: textPoppinsRegular(
                                    text: 'Total order',
                                    fontSize: 20,
                                  ),
                                ),
                                const Spacer(),
                                textPoppinsRegular(
                                  text: '40 SAR',
                                  fontSize: 18,
                                  textColor: const Color(0XFFE44544),
                                ),
                              ],
                            ),
                            // Delivery Time
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  const Image(
                                    width: 35,
                                    height: 35,
                                    image: AssetImage(
                                      'assets/delivery-time.PNG',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: textPoppinsRegular(
                                      text: 'Delivery Time',
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  textPoppinsRegular(
                                    text: '13:45',
                                    fontSize: 18,
                                    textColor: const Color(0XFFE44544),
                                  ),
                                ],
                              ),
                            ),
                            // Payment Method
                            Row(
                              children: [
                                const Image(
                                  width: 35,
                                  height: 35,
                                  image: AssetImage(
                                    'assets/payment-method.PNG',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: textPoppinsRegular(
                                    text: 'Payment Method',
                                    fontSize: 20,
                                  ),
                                ),
                                const Spacer(),
                                textPoppinsRegular(
                                  text: 'Visa',
                                  fontSize: 18,
                                  textColor: const Color(0XFFE44544),
                                ),
                              ],
                            ),
                            // Button
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 20, bottom: 10),
                              child: Row(
                                children: [
                                  defaultButton(
                                    buttonColor: const Color(0XFF80AF50),
                                    fontFamily: 'PoppinsMedium',
                                    buttonText: 'Received',
                                    radius: 24,
                                    width: 211,
                                    height: 36,
                                    onTapFunction: () {
                                      setState(() {
                                        isPickedUp = true;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RateClientScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  const Spacer(),
                                  defaultButton(
                                      fontFamily: 'PoppinsMedium',
                                      buttonText: 'cancel',
                                      radius: 24,
                                      width: 90,
                                      height: 36,
                                      onTapFunction: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                          15.0,
                                                        ),
                                                      ),
                                                    ),
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                          const Image(
                                                            width: 60,
                                                            height: 60,
                                                            image: AssetImage(
                                                              'assets/cancel.PNG',
                                                            ),
                                                          ),
                                                          textPoppinsMedium(
                                                            text:
                                                                "Reason for cancellation",
                                                            textColor:
                                                                const Color(
                                                                    0XFF43494B),
                                                            fontSize: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(
                                                            bottom: 10,
                                                            // start: 20,
                                                          ),
                                                          child: Column(
                                                            children: <Widget>[
                                                              textPoppinsRegular(
                                                                text:
                                                                    "Please type reason for cancel order delivery",
                                                                textColor:
                                                                    const Color(
                                                                        0XFF43494B),
                                                                fontSize: 14,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        20),
                                                                child: SizedBox(
                                                                  width: 321,
                                                                  height: 97,
                                                                  child:
                                                                      TextField(
                                                                    maxLines: 5,
                                                                    cursorColor:
                                                                        Colors
                                                                            .black38,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Client didn\'t receive the order',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'PoppinsRegular',
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(0XFF43494B)
                                                                            .withOpacity(.6),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(15)),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              const Color(0XFF43494B).withOpacity(.6),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(15)),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              const Color(0XFF43494B).withOpacity(.6),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              defaultButton(
                                                                height: 48,
                                                                width: 321,
                                                                buttonText:
                                                                    'Submit Review',
                                                                onTapFunction:
                                                                    () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .only(
                                                                  top: 10,
                                                                ),
                                                                child:
                                                                    defaultTextButton(
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  text:
                                                                      'Cancel',
                                                                  textFunction:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              )
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
                                ],
                              ),
                            ),
                            // Order Details Text Button
                            defaultTextButton(
                                text: 'Veiw Order Details',
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                textFunction: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderDetailsScreen()));
                                }),
                          ],
                        ),
                      ),
                      // Up Container
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0XFF444D50),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 15,
                            start: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image
                              const Image(
                                width: 60,
                                height: 60,
                                image: AssetImage(
                                  'assets/drawer.png',
                                ),
                              ),
                              // Restaurant Detailes
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Restaurant Name
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 7),
                                      child: textPoppinsRegular(
                                        text: 'Ahmed Mohamed',
                                        fontSize: 18,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    // Location
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          const Image(
                                            width: 25,
                                            height: 25,
                                            image: AssetImage(
                                              'assets/order-location1.PNG',
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: textPoppinsRegular(
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                text:
                                                    ',Ezbet El-Arab,Nasr City,',
                                                fontSize: 13,
                                                textColor:
                                                    const Color(0XFF00BFFF),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Directions
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFFFFFFF)
                                        .withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        5,
                                      ),
                                    ),
                                  ),
                                  child: const Image(
                                    width: 40,
                                    height: 40,
                                    image: AssetImage(
                                      'assets/direction1.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              // Not Picked
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                          top: 90,
                          start: 20,
                          end: 20,
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 350,
                        decoration: const BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Total order
                            Row(
                              children: [
                                const Image(
                                  width: 40,
                                  height: 40,
                                  image: AssetImage(
                                    'assets/total-order.PNG',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: textPoppinsRegular(
                                    text: 'Total order',
                                    fontSize: 20,
                                  ),
                                ),
                                const Spacer(),
                                textPoppinsRegular(
                                  text: '40 SAR',
                                  fontSize: 18,
                                  textColor: const Color(0XFFE44544),
                                ),
                              ],
                            ),
                            // Delivery Time
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                children: [
                                  const Image(
                                    width: 35,
                                    height: 35,
                                    image: AssetImage(
                                      'assets/delivery-time.PNG',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: textPoppinsRegular(
                                      text: 'Delivery Time',
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  textPoppinsRegular(
                                    text: '13:45',
                                    fontSize: 18,
                                    textColor: const Color(0XFFE44544),
                                  ),
                                ],
                              ),
                            ),
                            // Payment Method
                            Row(
                              children: [
                                const Image(
                                  width: 35,
                                  height: 35,
                                  image: AssetImage(
                                    'assets/payment-method.PNG',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: textPoppinsRegular(
                                    text: 'Payment Method',
                                    fontSize: 20,
                                  ),
                                ),
                                const Spacer(),
                                textPoppinsRegular(
                                  text: 'Visa',
                                  fontSize: 18,
                                  textColor: const Color(0XFFE44544),
                                ),
                              ],
                            ),
                            // Button
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 20, bottom: 10),
                              child: Row(
                                children: [
                                  defaultButton(
                                    buttonColor: const Color(0XFF80AF50),
                                    fontFamily: 'PoppinsMedium',
                                    buttonText: 'Pick Up',
                                    radius: 24,
                                    width: 211,
                                    height: 36,
                                    onTapFunction: () {
                                      setState(() {
                                        isPickedUp = true;
                                      });
                                    },
                                  ),
                                  const Spacer(),
                                  defaultButton(
                                      fontFamily: 'PoppinsMedium',
                                      buttonText: 'cancel',
                                      radius: 24,
                                      width: 90,
                                      height: 36,
                                      onTapFunction: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                          15.0,
                                                        ),
                                                      ),
                                                    ),
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                          const Image(
                                                            width: 60,
                                                            height: 60,
                                                            image: AssetImage(
                                                              'assets/cancel.PNG',
                                                            ),
                                                          ),
                                                          textPoppinsMedium(
                                                            text:
                                                                "Reason for cancellation",
                                                            textColor:
                                                                const Color(
                                                                    0XFF43494B),
                                                            fontSize: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(
                                                            bottom: 10,
                                                            // start: 20,
                                                          ),
                                                          child: Column(
                                                            children: <Widget>[
                                                              textPoppinsRegular(
                                                                text:
                                                                    "Please type reason for cancel order delivery",
                                                                textColor:
                                                                    const Color(
                                                                        0XFF43494B),
                                                                fontSize: 14,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        20),
                                                                child: SizedBox(
                                                                  width: 321,
                                                                  height: 97,
                                                                  child:
                                                                      TextField(
                                                                    maxLines: 5,
                                                                    cursorColor:
                                                                        Colors
                                                                            .black38,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Client didn\'t receive the order',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'PoppinsRegular',
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(0XFF43494B)
                                                                            .withOpacity(.6),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(15)),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              const Color(0XFF43494B).withOpacity(.6),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(15)),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              const Color(0XFF43494B).withOpacity(.6),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              defaultButton(
                                                                height: 48,
                                                                width: 321,
                                                                buttonText:
                                                                    'Submit Review',
                                                                onTapFunction:
                                                                    () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .only(
                                                                  top: 10,
                                                                ),
                                                                child:
                                                                    defaultTextButton(
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  text:
                                                                      'Cancel',
                                                                  textFunction:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              )
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
                                ],
                              ),
                            ),
                            // Order Details Text Button
                            defaultTextButton(
                                text: 'Veiw Order Details',
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                textFunction: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderDetailsScreen()));
                                }),
                          ],
                        ),
                      ),
                      // Up Container
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0XFF444D50),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 15,
                            start: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image
                              const Image(
                                width: 60,
                                height: 60,
                                image: AssetImage(
                                  'assets/order-request.png',
                                ),
                              ),
                              // Restaurant Detailes
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Restaurant Name
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 7),
                                      child: textPoppinsRegular(
                                        text: 'Restaurant Name',
                                        fontSize: 18,
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    // Location
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          const Image(
                                            width: 25,
                                            height: 25,
                                            image: AssetImage(
                                              'assets/order-location1.PNG',
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: textPoppinsRegular(
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                text:
                                                    ',Ezbet El-Arab,Nasr City,',
                                                fontSize: 13,
                                                textColor:
                                                    const Color(0XFF00BFFF),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Directions
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFFFFFFF)
                                        .withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        5,
                                      ),
                                    ),
                                  ),
                                  child: const Image(
                                    width: 40,
                                    height: 40,
                                    image: AssetImage(
                                      'assets/direction1.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
