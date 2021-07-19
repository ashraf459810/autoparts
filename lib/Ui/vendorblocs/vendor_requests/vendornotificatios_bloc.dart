import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/getVendorNotifications(requests)/GetVendorRequests.dart';

part 'vendornotificatios_event.dart';
part 'vendornotificatios_state.dart';

class VendornotificatiosBloc
    extends Bloc<VendornotificatiosEvent, VendornotificatiosState> {
  VendornotificatiosBloc() : super(VendornotificatiosInitial());
  List<Requests> requests = [];
  List<Requests> list = [];
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();

  @override
  Stream<VendornotificatiosState> mapEventToState(
    VendornotificatiosEvent event,
  ) async* {
    if (event is Getrequestsevent) {
      int id = await prefsHelper.getvendorid();
      requests = await helper.getvendorrequests(
          id: id, page: event.pages, size: event.size);
      if (requests != null)
        for (var s = 0; s < requests.length; s++) {
          list.add(requests[s]);
          print("list length" "${list.length}");
        }
      yield GetReqestState(list);
    }
  }
}
