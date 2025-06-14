import 'package:equatable/equatable.dart';

class PlateDetails extends Equatable {
  final String plateCode;
  final String plateSource;
  final String plateNumber;

  const PlateDetails({
    this.plateCode = "",
    this.plateSource = "",
    this.plateNumber = "",
  });

  /// ✅ CopyWith method
  PlateDetails copyWith({
    String? plateCode,
    String? plateSource,
    String? plateNumber,
  }) {
    return PlateDetails(
      plateCode: plateCode ?? this.plateCode,
      plateSource: plateSource ?? this.plateSource,
      plateNumber: plateNumber ?? this.plateNumber,
    );
  }

  static const empty = PlateDetails(
    plateCode: "",
    plateSource: "",
    plateNumber: "",
  );

  @override
  List<Object> get props => [plateCode, plateSource, plateNumber];
}
