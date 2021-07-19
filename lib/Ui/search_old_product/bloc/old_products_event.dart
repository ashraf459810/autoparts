part of 'old_products_bloc.dart';

@immutable
abstract class OldProductsEvent {}

class GetBrands extends OldProductsEvent {

}

class Get extends OldProductsEvent {
  final int page;
  final int size;
  Get(this.page, this.size);
}

// ignore: must_be_immutable
class GetCarByBrand extends OldProductsEvent {
  int id = 0;
  GetCarByBrand(this.id);
}

class ListallVendor extends OldProductsEvent {}

// ignore: must_be_immutable
class Addproductvendor extends OldProductsEvent {
  AddNewProductsVendor addNewProductsVendor = AddNewProductsVendor();

  Addproductvendor(this.addNewProductsVendor);
}

// ignore: must_be_immutable
class SendQutationEvent extends OldProductsEvent {
  SendQuotation sendQuotation = SendQuotation();

  SendQutationEvent(this.sendQuotation);
}
 class ResetBrands extends OldProductsEvent{}

class ResetVendorBrands  extends OldProductsEvent{}

 class GetVendorBrands extends OldProductsEvent{}