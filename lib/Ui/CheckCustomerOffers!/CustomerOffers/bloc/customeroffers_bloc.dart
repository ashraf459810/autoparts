import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';

import 'package:bloc/bloc.dart';
import 'package:autopart/model/CustomerOffers.dart/CustomerOffers.dart';
import 'package:meta/meta.dart';
part 'customeroffers_event.dart';
part 'customeroffers_state.dart';

class CustomeroffersBloc
    extends Bloc<CustomeroffersEvent, CustomeroffersState> {
  CustomeroffersBloc() : super(CustomeroffersInitial());
  HttpHelper helper = HttpHelper();
  CustomerOffers customerOffers = CustomerOffers();
  List<Offer> list = [];

  @override
  Stream<CustomeroffersState> mapEventToState(
    CustomeroffersEvent event,
  ) async* {
    if (event is GetOfferEvent) {
      yield Loading();

      List<Offer> offers = await helper.getcustomeroffers(
          id: event.requestid, size: event.size, page: event.pages);
     
      if (offers != null) {
        for (var s = 0; s < offers.length; s++) {
          list.add(offers[s]);
          print("list length" "${list.length}");
        }
      }
      yield GetOffersState(list);

      // yield OnError("some thing wrong check your internet connection");
    }
  }
}
