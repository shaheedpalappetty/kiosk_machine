import 'package:flutter/material.dart';
import 'package:testing/screens/payment.dart';
import 'package:testing/screens/plate_details.dart';
import 'package:testing/screens/welcome.dart';
import 'package:testing/utilities/textstyle.dart';
import 'package:testing/widgets/header.dart';
import 'package:testing/widgets/services_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Header(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 25,
              children: [
                const Text(
                  "Services",
                  style: AppTextStyles.heading,
                ),
                const SizedBox(
                  height: 20,
                ),
                ServicesWidget(
                  text: "TopUp Wallet",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      )),
                ),
                ServicesWidget(
                  text: "Pay Parking",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlateDetails(),
                      )),
                ),
                ServicesWidget(
                  text: "Pay Fines",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlateDetails(),
                      )),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
