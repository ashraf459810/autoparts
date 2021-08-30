part of 'profilebloc_bloc.dart';

@immutable
abstract class ProfileblocState {}

class ProfileblocInitial extends ProfileblocState {}

// ignore: must_be_immutable
class ISvendor extends ProfileblocState {
  bool isvendor;
  String email;
  String username;
  ISvendor(this.isvendor, this.email, this.username);
}

class Loading extends ProfileblocState {}

class RateState extends ProfileblocState {
  final String result;
  RateState(this.result);
}

class Error extends ProfileblocState {
  final String error;
  Error(this.error);
}

class SuggetsionState extends ProfileblocState {
  final String result;
  SuggetsionState(this.result);
}

class SupportState extends ProfileblocState {
  final String message;
  SupportState(this.message);
}

class GetVendorBrandsState extends ProfileblocState {
  final List<VendorBrands> brands;

  GetVendorBrandsState(this.brands);
}

class EditBrandsState extends ProfileblocState {
  final BrandsEdit brandsEdit;
  EditBrandsState(this.brandsEdit);
}

class CustomerFinishedOrdersState extends ProfileblocState {
  final List<FinishedOrders> finishedorders;

  CustomerFinishedOrdersState(this.finishedorders);
}

class PendingOrdersState extends ProfileblocState {
  final finishedorders;

  PendingOrdersState(this.finishedorders);
}
