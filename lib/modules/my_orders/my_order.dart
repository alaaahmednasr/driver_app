// ignore_for_file: unused_field

import 'package:driver_app/modules/my_orders/my_order_body.dart';
import 'package:driver_app/modules/new_orders/new_order.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                // App Bar
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 200,
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
                      bottom: 25,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NewOrderScreen(),
                                  ));
                            },
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        textPoppinsRegular(
                          text: 'My Orders',
                          textColor: Colors.white,
                          fontSize: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                // Tab bar tabs
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: TabBar(
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 20,
                      ),
                      tabs: [
                        Tab(
                          height: 30,
                          text: "Done",
                        ),
                        Tab(
                          height: 30,
                          text: "Cancel",
                        ),
                      ]),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  itemBuilder: (context, index) => const MyOrderBody(),
                  itemCount: 20,
                ),
                ListView.builder(
                  itemBuilder: (context, index) => const MyOrderBody(),
                  itemCount: 20,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
