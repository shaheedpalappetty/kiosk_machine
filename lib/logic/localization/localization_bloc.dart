import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/localization/localization_event.dart';
import 'package:testing/logic/localization/localization_state.dart';
import 'package:testing/utilities/shared_pref.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc({SharedPrefService? sharedPrefService})
      : _sharedPrefService = sharedPrefService ?? SharedPrefService.instance,
        super(const LocalizationState()) {
    on<LocaleChanged>(_onLocaleChanged);
    on<ToggleLocale>(_onToggleLocale);
    on<GetLocale>(_onGetLocale);
    on<LocalizationEvent>((event, emit) {
      if (event is LocaleChanged) {
        emit.call(LocalizationState(locale: event.locale));
      }
    });
  }

  final SharedPrefService _sharedPrefService;

  Future<void> _onLocaleChanged(
    LocaleChanged event,
    Emitter<LocalizationState> emit,
  ) async {
    if (event.locale == "en") {
      _sharedPrefService.setLocale("en");
    } else {
      _sharedPrefService.setLocale("ar");
    }
    return emit(LocalizationState(locale: event.locale));
  }

  Future<void> _onToggleLocale(
    ToggleLocale event,
    Emitter<LocalizationState> emit,
  ) async {
    if (state.locale == 'en') {
      add(const LocaleChanged("ar"));
      _sharedPrefService.setLocale("ar");
    } else {
      add(const LocaleChanged("en"));
      _sharedPrefService.setLocale("en");
    }
  }

  Future<void> _onGetLocale(
    GetLocale event,
    Emitter<LocalizationState> emit,
  ) async {
    add(LocaleChanged(await _sharedPrefService.getLocale()));
  }
}
