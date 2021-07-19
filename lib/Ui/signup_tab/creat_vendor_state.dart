part of 'creat_vendor_bloc.dart';

@immutable
abstract class CreatVendorState {}

class CreatVendorInitial extends CreatVendorState {}

// ignore: must_be_immutable
class CreateVendorSuccess extends CreatVendorState {
  Vendoresponse vendoresponse;
  CreateVendorSuccess(this.vendoresponse);
}

class VendorLoading extends CreatVendorState {
  VendorLoading();
}

// ignore: must_be_immutable
class Vendroerror extends CreatVendorState {
  String s;
  Vendroerror(this.s);
}

// ignore: must_be_immutable
class BrandState extends CreatVendorState {
  List<BrandModel> brands;

  BrandState(this.brands);
}
class Loading extends CreatVendorState {
  
}
