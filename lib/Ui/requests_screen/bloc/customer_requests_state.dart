part of 'customer_requests_bloc.dart';

@immutable
abstract class CustomerRequestsState {}

class CustomerRequestsInitial extends CustomerRequestsState {}

// ignore: must_be_immutable
class Loadedrequests extends CustomerRequestsState {
  List<CustomerRequests> list = [];

  Loadedrequests(this.list);
}
