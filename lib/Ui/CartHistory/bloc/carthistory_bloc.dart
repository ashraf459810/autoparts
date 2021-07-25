import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/CartHistory.dart';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'carthistory_event.dart';
part 'carthistory_state.dart';

class CarthistoryBloc extends Bloc<CarthistoryEvent, CarthistoryState> {
  CarthistoryBloc() : super(CarthistoryInitial());
  CartHistory cartHistory;
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  List<CartInfo> carts = [];

  @override
  Stream<CarthistoryState> mapEventToState(
    CarthistoryEvent event,
  ) async* {
    if (event is GetCartHistoryEvent) {
      yield Loading();
      int id = await prefsHelper.getcustomerid();
      cartHistory =
          await helper.getcustomerordershistory(event.pages, event.size, id);
      print("here");
      if (cartHistory == null) {
        yield Error("error while loading your orders");
      }
      if (cartHistory.carts.length == 0) {
      } else {
        for (var i = 0; i < cartHistory.carts.length; i++) {
          carts.add(cartHistory.carts[i]);
        }
        yield GetCartHistoyState(carts);
      }
    }
    if (event is ReturnItemEvent) {
      int id = await prefsHelper.getcustomerid();
      String result =
          await helper.requesttoreturnitem(id, event.itemid, event.reason);
      if (result == "Done") {
        yield ReturnItemState(result);
      } else
        yield Error("error while send the order");
    }
  }
}
