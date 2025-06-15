import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/l10n/app_localizations.dart';
import 'package:testing/logic/localization/localization_bloc.dart';
import 'package:testing/logic/localization/localization_event.dart';
import 'package:testing/logic/localization/localization_state.dart';
import 'package:testing/screens/services.dart';
import 'package:testing/utilities/constants.dart';
import 'package:testing/utilities/textstyle.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome Header Section
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    spacing: 12,
                    children: [
                      // App Icon or Logo placeholder
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            // color: const Color(0xFF005060),
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: const Color(0xFF005060).withOpacity(0.2),
                            //     blurRadius: 12,
                            //     offset: const Offset(0, 6),
                            //   ),
                            // ],
                          ),
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset(parkinLogo),
                          )),
                      Text(
                        '${AppLocalizations.of(context)!.welcomeTo} Parkin',
                        style: AppTextStyles.heading,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppLocalizations.of(context)!.selectLanguage,
                        style: AppTextStyles.subHeading,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Language Selection Section
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.33,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.08),
                    //     blurRadius: 20,
                    //     offset: const Offset(0, 8),
                    //   ),
                    // ],
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.chooseYourLanguage,
                        style: AppTextStyles.subHeading.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, state) {
                          bool isSelected = state.locale == "en";
                          return ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<LocalizationBloc>(context)
                                  .add(const LocaleChanged("en"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? const Color(0xFF005060)
                                  : const Color(0xFF58585C),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: isSelected ? 6 : 2,
                              shadowColor: isSelected
                                  ? const Color(0xFF005060).withOpacity(0.3)
                                  : Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                const Text(
                                  '🇺🇸',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.english,
                                  style: AppTextStyles.buttonText,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, state) {
                          bool isSelected = state.locale == "ar";
                          return ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<LocalizationBloc>(context)
                                  .add(const LocaleChanged("ar"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? const Color(0xFF005060)
                                  : const Color(0xFF58585C),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: isSelected ? 6 : 2,
                              shadowColor: isSelected
                                  ? const Color(0xFF005060).withOpacity(0.3)
                                  : Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                const Text(
                                  '🇦🇪',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.arabic,
                                  style: AppTextStyles.buttonText,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),

                // Continue Button
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.33,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF005060),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      shadowColor: const Color(0xFF005060).withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.continueText,
                          style: AppTextStyles.buttonText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom spacing
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
