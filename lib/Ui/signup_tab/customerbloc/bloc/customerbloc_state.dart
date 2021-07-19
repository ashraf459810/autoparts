part of 'customerbloc_bloc.dart';

@immutable
abstract class CustomerblocState {}

class CustomerblocInitial extends CustomerblocState {}

// ignore: must_be_immutable
class CustomerCreated extends CustomerblocState {
  CustomerResponse customerResponse;

  CustomerCreated(this.customerResponse);
}

// ignore: must_be_immutable
class Onerror extends CustomerblocState {
  String error;
  Onerror(this.error);
}
class LoadingCustomer extends CustomerblocState {
  
}
