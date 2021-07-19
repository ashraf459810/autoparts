part of 'rejectoffer_bloc.dart';

@immutable
abstract class RejectofferEvent {}

// ignore: must_be_immutable
class RejectOfferEvent extends RejectofferEvent {
  int offerid;
  RejectOfferEvent(this.offerid);
}