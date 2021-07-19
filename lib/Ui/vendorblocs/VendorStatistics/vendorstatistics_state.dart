part of 'vendorstatistics_bloc.dart';

@immutable
abstract class VendorstatisticsState {}

class VendorstatisticsInitial extends VendorstatisticsState {}

class Loading extends VendorstatisticsState {}

class GetStatisticsState extends VendorstatisticsState {
  final VendorStatisics vendorStatisics;
  GetStatisticsState(this.vendorStatisics);
}

class Error extends VendorstatisticsState {
  final String error;
  Error(this.error);
}
