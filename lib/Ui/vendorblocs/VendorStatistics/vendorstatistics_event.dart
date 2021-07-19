part of 'vendorstatistics_bloc.dart';

@immutable
abstract class VendorstatisticsEvent {}

class GetVendorStatisticsEvent extends VendorstatisticsEvent {
  final String date1;
  final String date2;
  
  GetVendorStatisticsEvent(this.date1, this.date2, );
}
