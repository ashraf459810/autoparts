import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/customerOfferNotification/CustomerOfferNotification.dart';
import 'package:autopart/model/CustomerRejectedRequest.dart';
part 'customernotification_event.dart';
part 'customernotification_state.dart';

class CustomernotificationBloc
    extends Bloc<CustomernotificationEvent, CustomernotificationState> {
  CustomernotificationBloc() : super(CustomernotificationInitial());
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();

  @override
  Stream<CustomernotificationState> mapEventToState(
    CustomernotificationEvent event,
  ) async* {
    if (event is GetOfferEvent) {
      yield Loading();
      int id = await prefsHelper.getcustomerid();
      print("from the bloc for customer id$id");
      print("from the bloc for customer ${event.offerid}}");

      var result = await helper.getcustomeroffernotification(
          customerid: id, offerid: event.offerid);
      try {
        CustomerOfferNotification customerOfferNotification =
            customerOfferNotificationFromJson(result);
        yield GetOfferState(customerOfferNotification);
      } catch (e) {
        CustomerRejectedRequest customerRejectedRequest =
            customerRejectedRequestFromJson(result);
        print("here from yeild");
        yield RejectedState(customerRejectedRequest);
      }
    }
  }
}
