import 'package:equatable/equatable.dart';

class PlateDetailsEvent extends Equatable {
  const PlateDetailsEvent();

  @override
  List<Object> get props => [];
}

class PlateCodeSelected extends PlateDetailsEvent {
  const PlateCodeSelected();

  @override
  List<Object> get props => [];
}

class PlateSourceSelected extends PlateDetailsEvent {
  const PlateSourceSelected();

  @override
  List<Object> get props => [];
}

class PlateNumberSelected extends PlateDetailsEvent {
  const PlateNumberSelected();

  @override
  List<Object> get props => [];
}

class PlateCodeChanged extends PlateDetailsEvent {
  final String plateCode;
  const PlateCodeChanged({required this.plateCode});

  @override
  List<Object> get props => [plateCode];
}

class PlateSourceChanged extends PlateDetailsEvent {
  final String plateSource;
  const PlateSourceChanged({required this.plateSource});

  @override
  List<Object> get props => [plateSource];
}

class PlateNumberChanged extends PlateDetailsEvent {
  final String plateNumber;
  const PlateNumberChanged({required this.plateNumber});

  @override
  List<Object> get props => [plateNumber];
}