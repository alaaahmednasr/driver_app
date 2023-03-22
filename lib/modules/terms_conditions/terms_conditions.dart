import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../new_orders/new_order.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'Terms & Conditions',
                    textColor: Colors.white,
                    fontSize: 30,
                  ),
                ],
              ),
            ),
          ),
          // Content
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
                end: 15,
                top: 25,
              ),
              child: textPoppinsMedium(
                text:
                    'WHO WE ARE AND WHAT THIS AGREEMENT DOES : '.toUpperCase(),
                textColor: const Color(0XFFE44544).withOpacity(.8),
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 175,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: textPoppinsRegular(
                text:
                    'We are Deliver E Hub Limited, a company registered in England and Wales whose company number is 10547511 and our registered office is at Bonded Warehouse, 18 Lower Byrom Street, Manchester, M3 4AP.(“We/us/our).You can contact us by writing to us at the above address or emailing us on support@deliveryapp.com',
                textColor: const Color(0XFF707070).withOpacity(.8),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 28,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: textPoppinsMedium(
                text: 'Your Privacy'.toUpperCase(),
                textColor: const Color(0XFFE44544).withOpacity(.8),
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 230,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: textPoppinsRegular(
                text:
                    'We only use any personal data we collect through your use of the App and the Services in the ways set out in our privacy policy. Please be aware that internet transmissions are never completely private or secure and that any message or information you send using the App or any Service may be read or intercepted by others, even if there is a special notice that a particular transmission is encrypted.',
                textColor: const Color(0XFF707070).withOpacity(.8),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 33,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: textPoppinsMedium(
                text: 'Additional Terms'.toUpperCase(),
                textColor: const Color(0XFFE44544).withOpacity(.8),
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 135,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: textPoppinsRegular(
                text:
                    'In addition to the terms set out in this Agreement, the following terms also apply:Our privacy and cookies policyOur website user terms and acceptable use policy Our Service terms and conditions: If you are a customer wishing to request the services of our drivers – Book a',
                textColor: const Color(0XFF707070).withOpacity(.8),
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
