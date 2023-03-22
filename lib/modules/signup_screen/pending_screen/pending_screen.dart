import 'dart:async';

import 'package:driver_app/modules/google_maps/google_maps.dart';
import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds:5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GoogleMapScreen(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE44544),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 364,
            decoration: const BoxDecoration(
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  60,
                ),
                bottomRight: Radius.circular(
                  60,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.only(bottom: 30),
              child: Image(
                image: AssetImage('assets/pending.PNG'),
                width: 300,
                height: 300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: SpinKitFadingCircle(
              size: 100,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index.isEven ? Colors.red : Colors.white,
                  ),
                );
              },
            ),
          ),
          textPoppinsMedium(text: 'Thank You'),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 20, bottom: 10),
            child: textPoppinsMedium(text: 'Your request is pending'),
          ),
          textPoppinsMedium(text: 'to approve!'),
        ],
      ),
    );
  }
}
