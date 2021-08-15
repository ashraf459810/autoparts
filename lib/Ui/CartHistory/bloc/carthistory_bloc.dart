import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/CartHistory.dart';
import 'package:autopart/model/ReturnRequestModel/ReturnRequestsModel.dart';

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
  List<CContent> returnrequests = [];

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
      print(cartHistory.carts.length);
      if (cartHistory == null) {
        yield Error("error while loading your orders");
      } else if (cartHistory.carts.length == 0) {
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
      print(result);
      if (result == "Done") {
        yield ReturnItemState(result);
      }
      if (result == null) yield Error("you already asked for return");
    }

    if (event is ReturnOrdersEvent) {
      try {
        int id = await prefsHelper.getcustomerid();
        ReturnRequestsModel requestsModel =
            await helper.getreturnrequests(id, event.page, event.size);
        if (requestsModel.content.isNotEmpty) {
          for (var i = 0; i < requestsModel.content.length; i++) {
            returnrequests.add(requestsModel.content[i]);
          }
        } else {}

        yield ReturnOrdersState(returnrequests);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
