part of 'autoshop_bloc.dart';

@immutable
abstract class AutoshopState {}

class AutoshopInitial extends AutoshopState {}

class GetShopProcutsState extends AutoshopState {
  final   List<ShopItems> newproducts ;
  final   List<ShopItems> oldproducts;

  GetShopProcutsState({this.newproducts,this.oldproducts});
}

class Loading extends AutoshopState {}

class Error extends AutoshopState {
  final String error;
  Error(this.error);
}
