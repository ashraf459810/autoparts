part of 'vendornotifications_bloc.dart';

@immutable
abstract class VendornotificationsState {}

class VendornotificationsInitial extends VendornotificationsState {}

class GetVendorNotificationsState extends VendornotificationsState {
  final List<VendorNot> listl;
  GetVendorNotificationsState(this.listl);
}

class Loading extends VendornotificationsState {}

class Error extends VendornotificationsState {
  final String error;
  Error(this.error);
}

class GetCustomerNotificationsState extends VendornotificationsState {
  final List<VendorNot> listl;
  GetCustomerNotificationsState(this.listl);
}
