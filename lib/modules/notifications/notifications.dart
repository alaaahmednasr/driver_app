import 'package:driver_app/modules/new_orders/new_order.dart';
import 'package:driver_app/modules/notifications/notifications_body.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0XFF43494B),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewOrderScreen(),
                  ));
            },
          ),
          title: textPoppinsRegular(
            text: 'Notifications',
            textColor: const Color(0XFF43494B),
            fontSize: 20,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => const NotificationBody(),
          itemCount: 20,
        ));
  }
}
