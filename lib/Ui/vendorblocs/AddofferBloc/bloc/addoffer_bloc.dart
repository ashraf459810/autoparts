import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addoffer_event.dart';
part 'addoffer_state.dart';

class AddofferBloc extends Bloc<AddofferEvent, AddofferState> {
  AddofferBloc() : super(AddofferInitial());
  HttpHelper helper = HttpHelper();

  @override
  Stream<AddofferState> mapEventToState(
    AddofferEvent event,
  ) async* {
    if (event is AddOfferEvent) {
      
        
      String result = await helper.addvendoroffer(
          days: event.days, price: event.price, offerid: event.offerid,condition: event.condition,warranty: event.warranty);

      if (result == "Done") {
        
        yield AddOfferState(result: result);
      } else {
        yield AddOfferErrorState(result: "Error while Adding Offer");
      }
    }
  }
}
