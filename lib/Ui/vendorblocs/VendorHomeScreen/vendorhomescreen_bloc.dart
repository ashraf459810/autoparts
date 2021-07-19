import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/Vendorpullproducts.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/VendorProductsModel.dart';
part 'vendorhomescreen_event.dart';
part 'vendorhomescreen_state.dart';

class VendorhomescreenBloc
    extends Bloc<VendorhomescreenEvent, VendorhomescreenState> {
  VendorhomescreenBloc() : super(VendorhomescreenInitial());
  PrefsHelper prefsHelper = PrefsHelper();
  HttpHelper helper = HttpHelper();
  List<Content> list = [];
  List<Content> newproducts = [];
  List<Content> usedproducts = [];
  VendorPullProducts vendorPullProducts;
  int old = 0;
  int modern = 0;
  @override
  Stream<VendorhomescreenState> mapEventToState(
    VendorhomescreenEvent event,
  ) async* {
    if (event is GetUsedProducts) {
      // if (old == 0) {
      //   yield LoadingUsed();
      //   old++;
      // }

      int id = await prefsHelper.getvendorid();
      vendorPullProducts =
          VendorPullProducts(id, event.pages, event.size, event.productType);
      list = await helper.getvendorproducts(
          vendorPullProducts: vendorPullProducts);
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          usedproducts.add(list[i]);
        }
      }

      yield VendorProductsUsedState(usedproducts);
    }
    if (event is GetNewProducts) {
      //    if (modern == 0) {
      //   yield LoadingNew();
      //   modern++;
      // }
      // yield Loading();
      int id = await prefsHelper.getvendorid();
      vendorPullProducts =
          VendorPullProducts(id, event.pages, event.size, event.productType);
      list = await helper.getvendorproducts(
          vendorPullProducts: vendorPullProducts);
      if (list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          newproducts.add(list[i]);
        }
      }

      yield VendorProductsNewState(newproducts);
    }
 
  }
}
