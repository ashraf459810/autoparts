part of 'vendorhomescreen_bloc.dart';

@immutable
abstract class VendorhomescreenEvent {}

class GetUsedProducts extends VendorhomescreenEvent {
  final String productType;
  final int pages;
  final int size;
  GetUsedProducts(this.pages, this.productType, this.size);
}

class GetNewProducts extends VendorhomescreenEvent {
  final String productType;
  final int pages;
  final int size;

  GetNewProducts(this.pages, this.productType, this.size);
}




