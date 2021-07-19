import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/VendorProductsModel.dart';
import 'package:autopart/model/Vendorpullproducts.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pullvendorproducts_event.dart';
part 'pullvendorproducts_state.dart';

class PullvendorproductsBloc
    extends Bloc<PullvendorproductsEvent, PullvendorproductsState> {
  PullvendorproductsBloc() : super(PullvendorproductsInitial());
  HttpHelper helper = HttpHelper();
  List<Content> list = [];
  PrefsHelper prefsHelper = PrefsHelper();
  List<Content> content = [];

  @override
  Stream<PullvendorproductsState> mapEventToState(
    PullvendorproductsEvent event,
  ) async* {
    if (event is Pullten) {
      int id = await prefsHelper.getvendorid();

      VendorPullProducts vendorPullProducts =
          VendorPullProducts(id, event.page, event.size, event.type);
      print("here from bloc");

      content = await helper.getvendorproducts(
          vendorPullProducts: vendorPullProducts);
      

      if (content != null)
        for (var s = 0; s < content.length; s++) {
          list.add(content[s]);
          print("list length" "${list.length}");
        }
    }

    yield GetVendorProductsState(list);
  }
}
