import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                // Person Photo
                const Image(
                  width: 80,
                  height: 80,
                  image: AssetImage('assets/drawer.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 1- Name
                    textPoppinsRegular(
                      text: 'Ahmed Mohamed request a new order',
                      fontSize: 17,
                      textColor: const Color(0XFF43494B).withOpacity(.7),
                    ),
                    textPoppinsRegular(
                      text: '1 hour ago',
                      fontSize: 15,
                      textColor: const Color(0XFF43494B).withOpacity(.5),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 15),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      width: 30,
                      height: 30,
                      image: AssetImage('assets/exit.PNG'),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
  }
}