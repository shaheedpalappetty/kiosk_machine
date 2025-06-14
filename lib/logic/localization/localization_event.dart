import 'package:equatable/equatable.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();
}

class LocaleChanged extends LocalizationEvent {
  const LocaleChanged(this.locale);

  final String locale;

  @override
  List<Object> get props => [locale];
}

class ToggleLocale extends LocalizationEvent {
  const ToggleLocale();

  @override
  List<Object> get props => [];
}

class GetLocale extends LocalizationEvent {
  const GetLocale();

  @override
  List<Object> get props => [];
}
