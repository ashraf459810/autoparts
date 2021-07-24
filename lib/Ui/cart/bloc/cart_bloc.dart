import 'dart:async';

import 'package:autopart/data/db_helper/db/DataBaseHelper.dart';
import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/GetCartModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();
  GetCartModel cart;
  double total = 0.0;
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetCartEvent) {
      yield Loading();
      int id = await prefsHelper.getcustomerid();
      print("customer id $id");
      cart = await helper.getbycart(id);

      if (cart != null) {
        await prefsHelper.setcartid(cart.id);
        yield GetCartState(cart.currentCartItems);
      } else {
        yield Error("Error While loading cart");
      }
    }
    if (event is AddProductEvent) {
      yield Loading();
      var id = await prefsHelper.getcartid();

      if (id != null) {
        cart = await helper.addProductfromSerachtocart(event.productid, id);
        if (cart != null) print("cart from making cart $cart");
        {
          if (cart != null) {
            yield AddProductState(cart.id);
          } else {
            yield Error("already have this product in your cart");
          }
        }
      } else {
        int productid = event.productid;
        add(GetCartEvent());

        add(AddProductEvent(productid));
      }
    }
    if (event is AddQoutaionEvent) {
      yield Loading();
      int id = await prefsHelper.getcartid();
      print("check id for cart before adding$cart");
      if (id != null) {
        cart = await helper.addQuotaiontocart(event.qoutationid, id);

        print("cart id from adding quotation$cart");
        if (cart != null) {
          yield AddProductState(cart.id);
        }
      } else {
        int offerid = event.qoutationid;
        print("here trying to make cart");
        add(GetCartEvent());
        add(AddQoutaionEvent(offerid));
      }
    }
    if (event is ConfirmCart) {
      yield Loading();
      int cartid = await prefsHelper.getcartid();
      int customerid = await prefsHelper.getcustomerid();
      if (cartid != null) {
        String result = await helper.confirmcart(customerid, event.x, event.y,
            event.city, event.street, event.country, cartid);
        if (result == "Done") {
          yield ConfirmCartState("Done");
        }
      }
      yield Error("Error while confirming cart");
    }
    if (event is CancelCart) {
      yield Loading();
      int id = await prefsHelper.getcartid();
      if (id != null) {
        String result = await helper.cancelcart(event.cartId);
        if (result == "Done") {
          yield CancelCartState("Done");
        }
      }
      yield Error("Error while canceling cart");
    }
    if (event is RemoveItemEvent) {
      yield Loading();
      int id = await prefsHelper.getcartid();
      if (id != null) {
        cart = await helper.removecartitem(id, event.itemid);
        if (cart != null) {
          yield RemoveItem(cart.currentCartItems);
        } else {
          yield Error("Error while canceling cart");
        }
      }
    }
  }
}
