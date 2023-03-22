import 'package:driver_app/modules/wallet/wallet.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class WalletDetailsScreen extends StatelessWidget {
  const WalletDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
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
                            builder: (context) => const WalletScreen(),
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  textPoppinsRegular(
                    text: 'Wallet',
                    textColor: Colors.white,
                    fontSize: 30,
                  ),
                ],
              ),
            ),
          ),
          // Balance Text
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: textPoppinsMedium(
              text: 'Total Balance',
              textColor: const Color(0XFF43494B),
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 30),
            child: textPoppinsMedium(
              text: 'SAR 120',
              textColor: const Color(0XFFE44544),
              fontSize: 32,
            ),
          ),
          // Body
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 140,
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
                  topLeft: Radius.circular(
                    60,
                  ),
                  topRight: Radius.circular(
                    60,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 25,
                  start: 30,
                  end: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPoppinsMedium(
                      text: 'Transactions',
                      textColor: const Color(0XFF43494B),
                      fontSize: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: ((context, index) => WalletBody()),
                        itemCount: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
