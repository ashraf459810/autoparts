part of 'vendoroffernot_bloc.dart';

@immutable
abstract class VendoroffernotEvent {}

class GetOfferNotEvent extends VendoroffernotEvent {
  final int offferid;
  final int vendorid;

  GetOfferNotEvent(this.offferid, this.vendorid);
}

class AddOfferEvent extends VendoroffernotEvent {
  final int days;
  final double price;
  final int offerid;
  final String condition;
  final int warranty;

  AddOfferEvent({this.days, this.offerid, this.price,this.condition,this.warranty});
}

class RejectOfferEvent extends VendoroffernotEvent {
  final int offerid;
  RejectOfferEvent(this.offerid);
}
