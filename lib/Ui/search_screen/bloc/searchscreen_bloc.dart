import 'dart:async';

// import 'package:autopart/Ui/search_old_product/Search_new_product/SearchNewProduct.dart';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/car_model/car_model.dart';
import 'package:autopart/model/SearchedProduct.dart';
import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

part 'searchscreen_event.dart';
part 'searchscreen_state.dart';

class SearchscreenBloc extends Bloc<SearchscreenEvent, SearchscreenState> {
  SearchscreenBloc() : super(SearchscreenInitial());
  HttpHelper helper = HttpHelper();
  List<BrandModel> brands = [];
  List<CarModel> cars = [];
  List<SearchResult> products = [];
  List<SearchResult> result = [];
  


  @override
  Stream<SearchscreenState> mapEventToState(
    SearchscreenEvent event,
  ) async* {
    if (event is Isvendor) {
      PrefsHelper prefsHelper = PrefsHelper();
      int id = await prefsHelper.getvendorid();
      if (id != null) {
        yield IsvendorState(true);
      } else
        yield IsvendorState(false);
    }

    if (event is GetBrandsEvent) {
      yield Loading();
      brands = await helper.getbrandd();
      if (brands == null) {
        yield Error("Error happened while Getting brands");
      } else {
        yield GetBrandsState(brands);
      }
    }
    if (event is GetcarsEvent) {
      yield Loading();
      cars = await helper.getcars(id: event.id);
      if (cars == null) {
        yield Error("Error happened while Getting cars");
      } else {
        yield GetCarsState(cars);
      }
    }
    if (event is SearchProduct) {
      // yield Loading();

      products = await helper.searchproduct(
        brand: event.brand,
        car: event.car,
        highprice: event.highprice,
        lowprice: event.lowprice,
        name: event.name,
        pages: event.pages,
        size: event.size,
        // year: event.year
      );

      print(products);
      if (products != null)
        for (var s = 0; s < products.length; s++) {
          result.add(products[s]);
        }
      yield Searchedproducts(result);
    }
  }
}
