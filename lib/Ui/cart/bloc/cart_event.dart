part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetCartEvent extends CartEvent {}

// class DeletItemEvent extends CartEvent {
//   final int id;
//   DeletItemEvent(this.id);
// }

class AddProductEvent extends CartEvent {
  final int productid;
  AddProductEvent(this.productid);
}

class AddQoutaionEvent extends CartEvent {
  final int qoutationid;
  AddQoutaionEvent(this.qoutationid);
}

class ConfirmCart extends CartEvent {
  final String country;
  final String city;
  final String street;
  final double x;
  final double y;
  ConfirmCart(this.city, this.country, this.x, this.y, this.street);
}

class CancelCart extends CartEvent {
  final int cartId;
  CancelCart(this.cartId);
}

class RemoveItemEvent extends CartEvent {
  final int itemid;
  RemoveItemEvent(this.itemid);
}
