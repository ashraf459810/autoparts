part of 'creat_vendor_bloc.dart';

@immutable
abstract class CreatVendorEvent {}

// ignore: must_be_immutable
class CreateVendor extends CreatVendorEvent {
  CreateVendorModel createVendorModel;
  CreateVendor(this.createVendorModel);
}



class Listbrands extends CreatVendorEvent {}
