part of 'addoffer_bloc.dart';

@immutable
abstract class AddofferEvent {}

// ignore: must_be_immutable
class AddOfferEvent extends AddofferEvent {
  int days;
  double price;
  int offerid;
  String condition;
  int warranty;

  AddOfferEvent({this.days, this.offerid, this.price,this.condition,this.warranty});
}
