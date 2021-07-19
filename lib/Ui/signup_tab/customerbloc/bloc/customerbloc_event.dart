part of 'customerbloc_bloc.dart';

@immutable
abstract class CustomerblocEvent {}

// ignore: must_be_immutable
class CreateCustomerevent extends CustomerblocEvent {
  CreateCustomer createCustomer;
  CreateCustomerevent(this.createCustomer);
}
