part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartState extends CartState {
  final List<CurrentCartItem> finalcart;

  GetCartState(this.finalcart);
}

class Loading extends CartState {}

class Error extends CartState {
  final String error;
  Error(this.error);
}

class AddProductState extends CartState {
  final int success;
  AddProductState(this.success);
}

class ConfirmCartState extends CartState {
  final String result;
  ConfirmCartState(this.result);
}

class CancelCartState extends CartState {
  final String result;
  CancelCartState(this.result);
}

class RemoveItem extends CartState {
  final List<CurrentCartItem> finalcart;
  RemoveItem(this.finalcart);
}
