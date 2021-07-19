part of 'vendornotifications_bloc.dart';

@immutable
abstract class VendornotificationsEvent {}

class GetVendorNotificationEvent extends VendornotificationsEvent {
  final int pages;
  final int size;
  GetVendorNotificationEvent(this.pages, this.size);
}

class GetCustomerNotificationEvent extends VendornotificationsEvent {
  final int pages;
  final int size;
 
  GetCustomerNotificationEvent(this.pages, this.size);
}
