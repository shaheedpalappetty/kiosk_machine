import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/localization/localization_bloc.dart';
import 'package:testing/logic/localization/localization_event.dart';
import 'package:testing/logic/localization/localization_state.dart';
import 'package:testing/screens/services.dart';
import 'package:testing/utilities/shared_pref.dart';
import 'package:testing/utilities/textstyle.dart';
import 'package:testing/widgets/header.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  'Welcome to Parkin',
                  style: AppTextStyles.heading
              ),
              const Text(
                  'Select Language',
                  style: AppTextStyles.subHeading
              ),
              BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<LocalizationBloc>(context).add(
                          const LocaleChanged("en"));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state.locale != "en" ? const Color(
                          0xFF58585C) : const Color(0xFF005060),
                      foregroundColor: Colors.white,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'English', style: AppTextStyles.buttonText,),
                  );
                },
              ),
              BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<LocalizationBloc>(context).add(
                          const LocaleChanged("ar"));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state.locale != "ar" ? const Color(
                          0xFF58585C) : const Color(0xFF005060),
                      foregroundColor: Colors.white,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Arabic', style: AppTextStyles.buttonText,),
                  );
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ServicesScreen(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF005060),
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continue', style: AppTextStyles.buttonText,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
