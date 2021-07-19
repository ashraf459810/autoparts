import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/VendorNotificationsModel.dart';
part 'vendornotifications_event.dart';
part 'vendornotifications_state.dart';

class VendornotificationsBloc
    extends Bloc<VendornotificationsEvent, VendornotificationsState> {
  VendornotificationsBloc() : super(VendornotificationsInitial());
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  List<VendorNot> notificaions = [];
  List<VendorNot> notificaionS = [];
 

  @override
  Stream<VendornotificationsState> mapEventToState(
    VendornotificationsEvent event,
  ) async* {
    if (event is GetVendorNotificationEvent) {
      // yield Loading();
      int id = await prefsHelper.getvendorid();
      notificaionS = await helper.getvendornotifications(id, event.pages, event.size);
      if (notificaionS != null) {
        for (var i = 0; i < notificaionS.length; i++) {
          notificaions.add(notificaionS[i]);
         
        }
        yield GetVendorNotificationsState(notificaions);
      } else {
        yield Error("Error while loading notificatons");
      }
    }
        if (event is GetCustomerNotificationEvent) {
      // yield Loading();
      int id = await prefsHelper.getcustomerid();
      notificaionS = await helper.getcustomernotifications(id, event.pages, event.size);
      if (notificaionS != null) {
        for (var i = 0; i < notificaionS.length; i++) {
          notificaions.add(notificaionS[i]);
         
        }
        yield GetCustomerNotificationsState(notificaions);
      } else {
        yield Error("Error while loading notificatons");
      }
    }
  }
}
