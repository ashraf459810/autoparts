import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/BrandPagenModel.dart';
import 'package:autopart/model/QuotationReponse.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorBrands.dart';

import 'package:autopart/model/vendor_add_products/AddNewProducts.dart';
import 'package:autopart/model/vendor_add_products/AddNewProductsResponse.dart';
import 'package:flutter/cupertino.dart';
import '../../../model/car_model/car_model.dart';
import 'package:autopart/model/listallresponseforvendor/list_all_for_vendor.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/Quotation.dart';
part 'old_products_event.dart';
part 'old_products_state.dart';

class OldProductsBloc extends Bloc<OldProductsEvent, OldProductsState> {
  // Repository repository = new Repository();
  HttpHelper helper = HttpHelper();
  OldProductsBloc() : super(OldProductsInitial());
  List<PagenBrands> paglist = [];
  PrefsHelper prefsHelper = PrefsHelper();

  @override
  Stream<OldProductsState> mapEventToState(
    OldProductsEvent event,
  ) async* {
    if (event is Get) {
      print("event is get");
      List<PagenBrands> list = [];

      list = await helper.getbrand(event.page, event.size);
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) paglist.add(list[i]);
      }
      yield LoadedBrands(paglist);
    }
    if (event is GetCarByBrand) {
      yield Loading();
      print("event is get cars");
      int id = event.id;
      List<CarModel> list = [];
      list = await helper.getcars(id: id);
      if (list != null) {
        yield GetCars(list);
      } else
        yield Onerror("there is error with your request");
      print('state is here');
    }
    if (event is ListallVendor) {
      yield LoadingProducts();

      List<ListAllVendorProducts> listt = await helper.listall();

      yield ListallVendorstate(listt);
    }

    if (event is Addproductvendor) {
      AddNewProductsVendor addNewProductsVendor = AddNewProductsVendor(
          brand: event.addNewProductsVendor.brand,
          price: event.addNewProductsVendor.price,
          defects: event.addNewProductsVendor.defects,
          product: event.addNewProductsVendor.product,
          vendor: event.addNewProductsVendor.vendor,
          years: event.addNewProductsVendor.years,
          car: event.addNewProductsVendor.car,
          attachments: event.addNewProductsVendor.attachments,
          productType: event.addNewProductsVendor.productType);

      print(event.addNewProductsVendor.brand.id);
      print(event.addNewProductsVendor.price);
      print(event.addNewProductsVendor.defects);
      print(event.addNewProductsVendor.product.id);

      AddNewProductsResponse response =
          await helper.addproducts(addNewProductsVendor: addNewProductsVendor);

      yield Addingproductforvendor(response);
    }

    if (event is SendQutationEvent) {
      yield Loading();
      QuotationResponse qutationResponse =
          await helper.sendqutation(sendQuotation: event.sendQuotation);
      print("from bloc $qutationResponse");

      if (qutationResponse == null) {
        yield Onerror("there is a problem with your request");
      } else {
        yield QutationResponse(qutationResponse);
      }
    }

    if (event is ResetBrands) {
      List<PagenBrands> list = [];

      list = await helper.getbrand(0, 20);

      yield LoadedBrands(list);
    }

    if (event is GetVendorBrands) {
      String brands = await prefsHelper.getvendorbrands();
      final List<VendorBrands> decodedbrands = VendorBrands.decode(brands);
      yield VendorBrandsState(decodedbrands);
    }

    if (event is ResetVendorBrands){
         String brands = await prefsHelper.getvendorbrands();
      final List<VendorBrands> decodedbrands = VendorBrands.decode(brands);
      yield VendorBrandsState(decodedbrands);



    }
  }
}
