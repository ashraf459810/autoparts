part of 'vendornotificatios_bloc.dart';

@immutable
abstract class VendornotificatiosEvent {}

// ignore: must_be_immutable
class Getrequestsevent extends VendornotificatiosEvent {
  int size;
  int id;
  int pages;
  Getrequestsevent(this.id, this.pages, this.size);
}
