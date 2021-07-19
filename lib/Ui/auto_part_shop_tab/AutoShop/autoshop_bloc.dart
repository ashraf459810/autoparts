import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/AutopartShop.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'autoshop_event.dart';
part 'autoshop_state.dart';

class AutoshopBloc extends Bloc<AutoshopEvent, AutoshopState> {
  AutoshopBloc() : super(AutoshopInitial());
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  List<ShopItems> newproducts = [];
  List<ShopItems> oldproducts = [];

  @override
  Stream<AutoshopState> mapEventToState(
    AutoshopEvent event,
  ) async* {
    if (event is GetShopProductsEvent) {
      // yield Loading();
      AutopartShop autopartShop1 =
          await helper.getshopitems("USED", event.page, event.size);

      if (autopartShop1.content.isNotEmpty) {
        for (var i = 0; i < autopartShop1.content.length; i++) {
          oldproducts.add(autopartShop1.content[i]);
        }
      }

      AutopartShop autopartShop2 =
          await helper.getshopitems("NEW", event.page, event.size);

             if (autopartShop2.content.isNotEmpty) {
        for (var i = 0; i < autopartShop2.content.length; i++) {
          newproducts.add(autopartShop2.content[i]);
           print(autopartShop2.content[i].attachments.length);
        }
      }

      if (autopartShop1 != null && autopartShop2 != null) {
        yield GetShopProcutsState(
            oldproducts: oldproducts,
            newproducts: newproducts);
      } else {
        yield Error("Error while Loading Products");
      }
    }
  }
}
