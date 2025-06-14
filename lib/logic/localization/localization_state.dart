import 'package:equatable/equatable.dart';

class LocalizationState extends Equatable {
  const LocalizationState({
    this.locale = "en"
  });

  final String locale;

  @override
  List<Object> get props => [locale];
}
