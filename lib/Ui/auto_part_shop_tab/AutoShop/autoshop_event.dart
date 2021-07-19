part of 'autoshop_bloc.dart';

@immutable
abstract class AutoshopEvent {}

class GetShopProductsEvent extends AutoshopEvent {
  
  final int page;
  final int size;
  GetShopProductsEvent( this.page,this.size);
}
