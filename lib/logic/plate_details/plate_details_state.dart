import 'package:equatable/equatable.dart';
import 'package:testing/models/plate_details.dart';

class PlateDetailsState extends Equatable {
  final PlateDetails plateDetails;
  final bool plateCodeSelected;
  final bool plateSourceSelected;
  final bool plateNumberSelected;
  final bool isPlateDetailsSet;

  const PlateDetailsState({
    this.plateDetails = const PlateDetails(),
    this.plateCodeSelected = false,
    this.plateSourceSelected = true,
    this.plateNumberSelected = false,
    this.isPlateDetailsSet = false,
  });

  PlateDetailsState copyWith({
    PlateDetails? plateDetails,
    bool? plateCodeSelected,
    bool? plateSourceSelected,
    bool? plateNumberSelected,
    bool? isPlateDetailsSet,
  }) {
    return PlateDetailsState(
      plateDetails: plateDetails ?? this.plateDetails,
      plateCodeSelected: plateCodeSelected ?? this.plateCodeSelected,
      plateSourceSelected: plateSourceSelected ?? this.plateSourceSelected,
      plateNumberSelected: plateNumberSelected ?? this.plateNumberSelected,
      isPlateDetailsSet: isPlateDetailsSet ?? this.isPlateDetailsSet,
    );
  }

  @override
  List<Object> get props => [
        plateDetails,
        plateCodeSelected,
        plateSourceSelected,
        plateNumberSelected,
        isPlateDetailsSet
      ];
}
