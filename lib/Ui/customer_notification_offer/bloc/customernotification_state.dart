part of 'customernotification_bloc.dart';

@immutable
abstract class CustomernotificationState {}

class CustomernotificationInitial extends CustomernotificationState {}

class Loading extends CustomernotificationState {}

class Error extends CustomernotificationState {
  final String error;
  Error(this.error);
}

class GetOfferState extends CustomernotificationState {
  final CustomerOfferNotification customerOfferNotification;
  GetOfferState(this.customerOfferNotification);
}

class RejectedState extends CustomernotificationState {
  final CustomerRejectedRequest customerRejectedRequest;
  RejectedState(this.customerRejectedRequest);
}
