import 'package:driver_app/modules/wallet/wallet_details.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../shared/components/components.dart';
import '../new_orders/new_order.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // AppBar
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
                            builder: (context) => const NewOrderScreen(),
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
          // Image
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 10,
            ),
            child: SizedBox(
                width: 300,
                height: 300,
                child: Lottie.asset('assets/129858-dancing-wallet-coins.json')),
          ),
          //Wallet Container
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 30,
                    children: List.generate(
                        9,
                        (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletDetailsScreen(),
                                    ));
                              },
                              child: Container(
                                width: 156,
                                height: 160,
                                decoration: BoxDecoration(
                                  gradient: index % 2 == 0
                                      ? LinearGradient(
                                          colors: [
                                            const Color(0XFF8A8F93)
                                                .withOpacity(.24),
                                            const Color(0XFF000000)
                                                .withOpacity(.24),
                                          ],
                                        )
                                      : LinearGradient(
                                          colors: [
                                            const Color(0XFFD5C0B6)
                                                .withOpacity(.21),
                                            const Color(0XFFE44544)
                                                .withOpacity(.21),
                                          ],
                                        ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      child: textPoppinsMedium(
                                        text: 'April 2022',
                                        fontSize: 20,
                                        textColor: index % 2 == 0
                                            ? const Color(0XFF43494B)
                                            : const Color(0XFFE44544),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        start: 40,
                                        top: 20,
                                      ),
                                      child: textPoppinsMedium(
                                        text: 'SAR 150',
                                        fontSize: 20,
                                        textColor: index % 2 == 0
                                            ? const Color(0XFFE44544)
                                            : const Color(0XFF43494B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        growable: true),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
