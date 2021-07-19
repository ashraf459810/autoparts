import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial());

  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is Sign) {
      yield Loading();

      print("here from vendor sigh in ");
      // VendorLogin vendorLogin
      String response = await helper.signin(mobile: event.mobile);
      if (response == "OTP has been sent successfully.") {
        // await prefsHelper.setvendorid(vendorLogin.id);
        // String token = await prefsHelper.gettoken();
        // print("vandor token is {$token}");
        // int id = await prefsHelper.getvendorid();
        // String s = await helper.savetokenforvendor(id: id, token: token);
        // print(s);
        // await prefsHelper.setislogin(true);
        // await prefsHelper.setislogin(true);

        // print("vendor id ");
        // print(await prefsHelper.getvendorid());
        // await prefsHelper.setisverify(true);
        yield SignState("Done");
      } else
        yield SignError("wrong number");
    }

    if (event is SignCustomer) {
      yield Loading();
      // CustomerLogin customerLogin = CustomerLogin();

      String customerLogin = await helper.customerlogin(mobile: event.mobile);
      print("reponse" "$customerLogin");

      if (customerLogin == "OTP has been sent successfully.") {
        // await prefsHelper.setcustomerid(customerLogin.id);
        // String token = await prefsHelper.gettoken();
        // int id = await prefsHelper.getcustomerid();
        // await helper.savetokenforcustomer(id: id, token: token);
        // await prefsHelper.setislogin(true);

        // await prefsHelper.setisverify(true);
        yield SignCustomerState("Done");
      } else {
        yield SignError("wrong number");
      }
    }
  }
}
