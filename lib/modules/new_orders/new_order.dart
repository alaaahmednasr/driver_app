// ignore_for_file: avoid_unnecessary_containers, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:driver_app/modules/new_orders/cubit/order_cubit.dart';
import 'package:driver_app/modules/new_orders/cubit/order_states.dart';
import 'package:driver_app/modules/no_internet/no_internet.dart';
import 'package:driver_app/modules/notifications/notifications.dart';
import 'package:driver_app/modules/order_details/order_details.dart';
import 'package:driver_app/modules/settings/settings.dart';
import 'package:driver_app/modules/terms_conditions/terms_conditions.dart';
import 'package:driver_app/modules/wallet/wallet.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login_screen/login_screen.dart';
import '../my_orders/my_order.dart';
import 'order_request_body.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  NewOrderScreenState createState() => NewOrderScreenState();
}

class NewOrderScreenState extends State<NewOrderScreen> {
  double _value = 3.5;
  bool switchValue = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Connectivity connectivity = Connectivity();

  @override
  void initState() {
    OrderCubit.getCubit(context).getOrder();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (context, snapshot) {
            return NoInternetScreen(
              snapshot: snapshot,
              widget: Scaffold(
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
                            animationDuration:
                                const Duration(milliseconds: 1000),
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
                                  builder: (context) =>
                                      const NotificationScreen(),
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
                                  builder: (context) =>
                                      const TermsAndConditions(),
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
                                  builder: (context) =>
                                      const OrderDetailsScreen(),
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
                              CacheHelper.removeData(key: 'token')
                                  .then((value) {
                                if (value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                      (route) => false);
                                }
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1- Order Requests App Bar
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 190,
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
                          top: 25,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              icon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: textPoppinsRegular(
                                text: 'Order Requests',
                                textColor: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 2- Text
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 20,
                        bottom: 20,
                        start: 30,
                      ),
                      child: Column(
                        // 1- Text
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textPoppinsRegular(
                            text: 'Hello Driver Name,',
                            fontSize: 25,
                            textColor: const Color(0XFF43494B),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          textPoppinsRegular(
                            text: 'Our customers wait their order quickly',
                            fontSize: 18,
                            textColor:
                                const Color(0XFF43494B).withOpacity(0.76),
                          ),
                        ],
                      ),
                    ),

                    // 3- Order Requests
                    Expanded(
                      child: RefreshIndicator(
                        color: const Color(0XFFE44544),
                        onRefresh: () async {
                          await Future.delayed(
                              const Duration(milliseconds: 1500));
                          OrderCubit.getCubit(context).getOrder();
                        },
                        child: ListView(
                          children: [
                            ConditionalBuilder(
                              fallback: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: Color(0XFFE44544)),
                                );
                              },
                              condition: OrderCubit.getCubit(context)
                                      .orderModel
                                      ?.data !=
                                  null,
                              builder: (BuildContext context) {
                                if (state is! OrderScusessState) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        color: Color(0XFFE44544)),
                                  );
                                } else {
                                  return Center(
                                    child: Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      children: List.generate(
                                        OrderCubit.getCubit(context)
                                            .orderModel!
                                            .data!
                                            .length,
                                        (index) => OrderRequestBody(
                                          resturantName:
                                              OrderCubit.getCubit(context)
                                                  .orderModel
                                                  ?.data![index]
                                                  .clientName as String,
                                          total: OrderCubit.getCubit(context)
                                              .orderModel
                                              ?.data![index]
                                              .total
                                              .toString(),
                                        ),
                                        growable: true,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
