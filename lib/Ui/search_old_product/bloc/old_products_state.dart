part of 'old_products_bloc.dart';

@immutable
abstract class OldProductsState {}

class OldProductsInitial extends OldProductsState {}

// ignore: must_be_immutable
class LoadedBrands extends OldProductsState {
  List<PagenBrands> list;
  LoadedBrands(this.list);
}

// ignore: must_be_immutable
class GetCars extends OldProductsState {
  List<CarModel> carList;
  GetCars(this.carList);
}

// ignore: must_be_immutable
class ListallVendorstate extends OldProductsState {
  List<ListAllVendorProducts> allproducts;
  ListallVendorstate(this.allproducts);
}

// ignore: must_be_immutable
class Addingproductforvendor extends OldProductsState {
  AddNewProductsResponse addNewProductsResponse = AddNewProductsResponse();
  Addingproductforvendor(this.addNewProductsResponse);
}

// ignore: must_be_immutable
class QutationResponse extends OldProductsState {
  QuotationResponse result;
  QutationResponse(this.result);
}

class Loading extends OldProductsState {}

class LoadingProducts extends OldProductsState {}

// ignore: must_be_immutable
class Onerror extends OldProductsState {
  String error = "error";
  Onerror(this.error);
}

class VendorBrandsState extends OldProductsState {
 final List<VendorBrands> brands;
  VendorBrandsState(this.brands);
}
