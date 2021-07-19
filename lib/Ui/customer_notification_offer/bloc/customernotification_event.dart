part of 'customernotification_bloc.dart';

@immutable
abstract class CustomernotificationEvent {}

class GetOfferEvent extends CustomernotificationEvent {
  final int offerid;

  GetOfferEvent(this.offerid);
}

class AddToCartEvent extends CustomernotificationEvent {}
