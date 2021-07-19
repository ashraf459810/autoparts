part of 'vendoroffernot_bloc.dart';

@immutable
abstract class VendoroffernotState {}

class VendoroffernotInitial extends VendoroffernotState {}

class GetOfferNotState extends VendoroffernotState {
  final VendorOfferNotificationModel vendorOfferNotification;
  GetOfferNotState({this.vendorOfferNotification});
}

class RejecOfferState extends VendoroffernotState {
  final String result;
  RejecOfferState(this.result);
}

class AddOfferState extends VendoroffernotState {
  final String result;

  AddOfferState({this.result});
}

class Loading extends VendoroffernotState {}

class Error extends VendoroffernotState {
  final String error;
  Error(this.error);
}
