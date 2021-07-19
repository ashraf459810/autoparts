part of 'checkcode_bloc.dart';

@immutable
abstract class CheckcodeState {}

class CheckcodeInitial extends CheckcodeState {}

// ignore: must_be_immutable
class Coderesult extends CheckcodeState {
  CustomerInfo customerInfo = CustomerInfo();
  Coderesult(this.customerInfo);
}

// ignore: must_be_immutable
class CoderesultVendor extends CheckcodeState {
  VendorInfo vendorInfo = VendorInfo();
  CoderesultVendor(this.vendorInfo);
}

// ignore: must_be_immutable
class VerifyError extends CheckcodeState {
  String message;

  VerifyError(this.message);

}

class Loading extends CheckcodeState{}
