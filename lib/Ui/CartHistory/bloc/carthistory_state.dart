part of 'carthistory_bloc.dart';

@immutable
abstract class CarthistoryState {}

class CarthistoryInitial extends CarthistoryState {}

class GetCartHistoyState extends CarthistoryState {
  final List<CartInfo> carts;
  GetCartHistoyState(this.carts);
}

class Loading extends CarthistoryState {}

class Error extends CarthistoryState {
  final String error;
  Error(this.error);
}

class ReturnItemState extends CarthistoryState {
  final String success;

  ReturnItemState(this.success);
}
