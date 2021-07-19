part of 'customer_requests_bloc.dart';

@immutable
abstract class CustomerRequestsEvent {}

// ignore: must_be_immutable
class LoadRequests extends CustomerRequestsEvent {
  int size;
  int pages;
  LoadRequests(this.pages, this.size);
}
