part of 'vendorhomescreen_bloc.dart';

@immutable
abstract class VendorhomescreenState {}

class VendorhomescreenInitial extends VendorhomescreenState {}

class VendorProductsNewState extends VendorhomescreenState {
  final List<Content> newproducts;
  VendorProductsNewState(this.newproducts);
}

class VendorProductsUsedState extends VendorhomescreenState {
  final List<Content> usedProducts;
  VendorProductsUsedState(this.usedProducts);
}


class Error extends VendorhomescreenState {
  final String error;
  Error(this.error);
}


class StateHandler extends VendorhomescreenState {}