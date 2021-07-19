import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rejectoffer_event.dart';
part 'rejectoffer_state.dart';

class RejectofferBloc extends Bloc<RejectofferEvent, RejectofferState> {
  RejectofferBloc() : super(RejectofferInitial());
  HttpHelper helper = HttpHelper();

  @override
  Stream<RejectofferState> mapEventToState(
    RejectofferEvent event,
  ) async* {
    if (event is RejectOfferEvent) {
      String result =
          await helper.replyvendornotavailable(offerid: event.offerid );
      if (result == "Done") {
        yield RejecOfferState(result);
      } else {
        yield RejectOfferError("Error while Adding Offer");
      }
    }
  }
}
