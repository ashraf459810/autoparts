part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

// ignore: must_be_immutable
class SignState extends SigninState {
  // VendorLogin = = VendorLogin();
  String vendorLogin;
  SignState(this.vendorLogin);
}

// ignore: must_be_immutable
class SignError extends SigninState {
  String s;
  SignError(this.s);
}

// ignore: must_be_immutable
class SignCustomerState extends SigninState {
  // CustomerLogin customerLogin = CustomerLogin();
  String customerLogin;
  SignCustomerState(this.customerLogin);
}

class Loading extends SigninState {}
