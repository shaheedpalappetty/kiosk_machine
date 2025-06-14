import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/localization/localization_bloc.dart';
import 'package:testing/logic/localization/localization_state.dart';
import 'package:testing/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ParkinKioskApp());
}

class ParkinKioskApp extends StatelessWidget {
  const ParkinKioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc(),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(state.locale, ''),
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            /*localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],*/
            debugShowCheckedModeBanner: false,
            title: 'ParkinKioskApp',
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFFF2FAEE),
              useMaterial3: true,
            ),
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
