import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/localization/localization_bloc.dart';
import 'package:testing/logic/localization/localization_event.dart';
import 'package:testing/logic/localization/localization_state.dart';
import 'package:testing/models/language.dart';
import 'package:testing/utilities/constants.dart';
import 'package:testing/utilities/shared_pref.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AspectRatio(
            aspectRatio: 1 / 1,
            child: Image(
              image: AssetImage(parkinLogo),
              fit: BoxFit.contain,
            ),
          ),
          BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(SharedPrefService.instance.getLocalizedTime()),
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        title!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF005060)),
                      ),
                    ),
                ],
              );
            },
          ),
          BlocBuilder<LocalizationBloc, LocalizationState>(
            builder: (context, state) {
              final currentLanguage = languages.firstWhere(
                (lang) => lang.code == state.locale,
                orElse: () => languages.first,
              );

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFFF2FAEE),
                    value: currentLanguage.code,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    borderRadius: BorderRadius.circular(8),
                    icon: const Icon(Icons.arrow_drop_down),
                    items: languages.map((LanguageModel language) {
                      return DropdownMenuItem<String>(
                        value: language.code,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(language.flag,
                                style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 8),
                            Text(language.name),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        context
                            .read<LocalizationBloc>()
                            .add(LocaleChanged(newValue));
                      }
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
