import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/RequestForCustomers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_requests_event.dart';
part 'customer_requests_state.dart';

class CustomerRequestsBloc
    extends Bloc<CustomerRequestsEvent, CustomerRequestsState> {
  CustomerRequestsBloc() : super(CustomerRequestsInitial());
  PrefsHelper prefsHelper = PrefsHelper();
  HttpHelper httpHelper = HttpHelper();
  List<CustomerRequests> list = [];
  List<CustomerRequests> content = [];

  @override
  Stream<CustomerRequestsState> mapEventToState(
    CustomerRequestsEvent event,
  ) async* {
    if (event is LoadRequests) {
      int id = await prefsHelper.getcustomerid();
      content = await httpHelper.getcustomerrequests(
          id: id, pages: event.pages, size: event.size);
      if (content != null)
        for (var s = 0; s < content.length; s++) {
          list.add(content[s]);
          print("list length" "${list.length}");
        }
    }
    yield Loadedrequests(this.list);
  }
}
