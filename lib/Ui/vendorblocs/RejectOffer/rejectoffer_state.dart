part of 'rejectoffer_bloc.dart';

@immutable
abstract class RejectofferState {}

class RejectofferInitial extends RejectofferState {}


// ignore: must_be_immutable
class RejecOfferState extends RejectofferState {
  String result;
  RejecOfferState(this.result);
}

// ignore: must_be_immutable
class RejectOfferError extends RejectofferState {
  String result;
  RejectOfferError(this.result);
}