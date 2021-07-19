import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/createCustomer.dart';
import 'package:autopart/model/customerResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customerbloc_event.dart';
part 'customerbloc_state.dart';

class CustomerblocBloc extends Bloc<CustomerblocEvent, CustomerblocState> {
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  CustomerblocBloc() : super(CustomerblocInitial());

  @override
  Stream<CustomerblocState> mapEventToState(
    CustomerblocEvent event,
  ) async* {
    if (event is CreateCustomerevent) {
      yield LoadingCustomer();
      CustomerResponse customerResponse =
          await helper.createcustomer(customer: event.createCustomer);
      print("here customer response");
      print(customerResponse.message);

      if (customerResponse.message == null) {
        await prefsHelper.setcustomerid(customerResponse.id);
        // await prefsHelper.setislogin(true);
        // String token = await prefsHelper.gettoken();
        // await helper.savetokenforcustomer(
        //     id: customerResponse.id, token: token);
        // print(token);

        yield CustomerCreated(customerResponse);
      } else {
        yield Onerror(customerResponse.message);
      }
    }
  }
}
