import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/logic/plate_details/plate_details_event.dart';
import 'package:testing/logic/plate_details/plate_details_state.dart';
import 'package:testing/models/plate_details.dart';

class PlateDetailsBloc extends Bloc<PlateDetailsEvent, PlateDetailsState> {
  PlateDetailsBloc() : super(const PlateDetailsState()) {
    on<PlateCodeSelected>(_onPlateCodeSelected);
    on<PlateSourceSelected>(_onPlateSourceSelected);
    on<PlateNumberSelected>(_onPlateNumberSelected);
    on<PlateCodeChanged>(_onPlateCodeChanged);
  }

  FutureOr<void> _onPlateCodeSelected(
      PlateCodeSelected event, Emitter<PlateDetailsState> emit) {
    emit(state.copyWith(
        plateCodeSelected: true,
        plateNumberSelected: false,
        plateSourceSelected: false));
  }

  FutureOr<void> _onPlateSourceSelected(
      PlateSourceSelected event, Emitter<PlateDetailsState> emit) {
    emit(state.copyWith(
        plateCodeSelected: false,
        plateNumberSelected: false,
        plateSourceSelected: true));
  }

  FutureOr<void> _onPlateNumberSelected(
      PlateNumberSelected event, Emitter<PlateDetailsState> emit) {
    emit(state.copyWith(
        plateCodeSelected: false,
        plateNumberSelected: true,
        plateSourceSelected: false));
  }

  FutureOr<void> _onPlateCodeChanged(
      PlateCodeChanged event, Emitter<PlateDetailsState> emit) {
    final newPlateDetails =
        state.plateDetails.copyWith(plateCode: event.plateCode);

    emit(state.copyWith(
        plateDetails: newPlateDetails,
        isPlateDetailsSet: newPlateDetails != PlateDetails.empty));
  }
}
