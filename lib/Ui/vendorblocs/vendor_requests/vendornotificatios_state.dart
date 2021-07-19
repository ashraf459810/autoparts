part of 'vendornotificatios_bloc.dart';

@immutable
abstract class VendornotificatiosState {}

class VendornotificatiosInitial extends VendornotificatiosState {}

// ignore: must_be_immutable
class GetReqestState extends VendornotificatiosState {
  List<Requests> getVendorRequests;

  GetReqestState(this.getVendorRequests);
}
