import 'package:flutter/material.dart';
import 'package:testing/l10n/app_localizations.dart';
import 'package:testing/screens/plate_details.dart';
import 'package:testing/screens/topup_wallet.dart';
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
                Text(
                  AppLocalizations.of(context)!.services,
                  style: AppTextStyles.heading,
                ),
                const SizedBox(
                  height: 20,
                ),
                ServicesWidget(
                  text: AppLocalizations.of(context)!.topupWallet,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TopupWallet(),
                      )),
                ),
                ServicesWidget(
                  text: AppLocalizations.of(context)!.payParking,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlateDetails(),
                      )),
                ),
                ServicesWidget(
                  text: AppLocalizations.of(context)!.payFines,
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
