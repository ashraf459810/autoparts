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
  final int cartId;
  ConfirmCart(this.cartId);
}

class CancelCart extends CartEvent {
  final int cartId;
  CancelCart(this.cartId);
}

class RemoveItemEvent extends CartEvent {

  final int itemid;
  RemoveItemEvent( this.itemid);
}
