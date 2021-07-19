import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';

import 'package:autopart/model/VendorOfferNotification.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vendoroffernot_event.dart';
part 'vendoroffernot_state.dart';

class VendoroffernotBloc
    extends Bloc<VendoroffernotEvent, VendoroffernotState> {
  VendoroffernotBloc() : super(VendoroffernotInitial());
  HttpHelper httpHelper = HttpHelper();

  @override
  Stream<VendoroffernotState> mapEventToState(
    VendoroffernotEvent event,
  ) async* {
    if (event is GetOfferNotEvent) {
      print("here from the bloc");
      yield Loading();

      VendorOfferNotificationModel vendorOfferNotificationModel =
          await httpHelper.vendorofferfromnotification(
              offerId: event.offferid, vendorId: event.vendorid,);

      if (vendorOfferNotificationModel != null) {
        yield GetOfferNotState(
            vendorOfferNotification: vendorOfferNotificationModel);
      } else {
        yield Error("there is a problem with your offer");
      }
    }

    if (event is AddOfferEvent) {
      yield Loading();
      String result = await httpHelper.addvendoroffer(
          days: event.days, price: event.price, offerid: event.offerid,condition: event.condition,warranty: event.warranty);
      if (result == "Done") {
        yield AddOfferState(result: "your offer added successfully");
      } else {
        yield Error("Error while Adding Offer");
      }}
      if (event is RejectOfferEvent) {
        print("here from bloc");
        String result =
            await httpHelper.replyvendornotavailable(offerid: event.offerid);
        print(result);
        if (result == "Done") {
          yield RejecOfferState("order not available sent successfully");
        } else {
          yield Error(result);
        }
      }
    }
  }

