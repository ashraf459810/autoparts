part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

// ignore: must_be_immutable
class Sign extends SigninEvent {
  String mobile;
 
  Sign(this.mobile);
}

// ignore: must_be_immutable
class SignCustomer extends SigninEvent {
  String mobile;
 
  SignCustomer({this.mobile});
}
