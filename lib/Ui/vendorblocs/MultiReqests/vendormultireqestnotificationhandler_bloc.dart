import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/MultiReqestforQuotationNotification.dart';
part 'vendormultireqestnotificationhandler_event.dart';
part 'vendormultireqestnotificationhandler_state.dart';

class VendormultireqestnotificationhandlerBloc extends Bloc<
    VendormultireqestnotificationhandlerEvent,
    VendormultireqestnotificationhandlerState> {
  VendormultireqestnotificationhandlerBloc()
      : super(VendormultireqestnotificationhandlerInitial());
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  List<MultiReqestQModel> list = [];
  @override
  Stream<VendormultireqestnotificationhandlerState> mapEventToState(
    VendormultireqestnotificationhandlerEvent event,
  ) async* {
    if (event is GetRequestsEvent) {
      yield Loading();
      int id = await prefsHelper.getvendorid();
      list = await helper.multirequestforquotationnotification(
          id, event.requestid);
      print(list.length);
      print("here the lenght from bloc");

      if (list.isNotEmpty) {
        yield GetRequestsState(list);
      } else {
        yield Error("Error while loading your requests");
      }
    }
  }
}
