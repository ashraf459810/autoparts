import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorBrands.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/CustomerInfoAfterVerify/CustomerInfo.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorInfo.dart';
part 'checkcode_event.dart';
part 'checkcode_state.dart';

class Checkcode extends Bloc<CheckcodeEvent, CheckcodeState> {
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  CustomerInfo customerInfo = CustomerInfo();
  List<VendorBrands> brands = [];
  Checkcode() : super(CheckcodeInitial());

  @override
  Stream<CheckcodeState> mapEventToState(
    CheckcodeEvent event,
  ) async* {
    if (event is Codecheck) {
      yield Loading();
      print("from vendor");
      print(event.code);
      print(event.mobile);
      VendorInfo vendorInfo =
          await helper.checksmscode(code: event.code, mobile: event.mobile);

      if (vendorInfo.message == null) {
        await prefsHelper.setvendorid(vendorInfo.id);
        print("id for vednor");
        print(prefsHelper.getvendorid());
        await prefsHelper.setislogin(true);
        await prefsHelper.setusername(vendorInfo.fullName);
        await prefsHelper.setemail(vendorInfo.email);
        for (var i = 0; i < vendorInfo.brands.length; i++) {
    
          // list.add(vendorInfo.brands[i].name);
          brands.add(VendorBrands(
              id: vendorInfo.brands[i].id,
              name: vendorInfo.brands[i].name,
              img: vendorInfo.brands[i].attachments[0].publicUrl));
    
        }
                  final String encodedData = VendorBrands.encode(brands);
            
          await prefsHelper.setvendorbrands(encodedData);

        ///here to set vendor brands
        String token = await prefsHelper.gettoken();
        print("token from shared $token");
        await helper.savetokenforvendor(id: vendorInfo.id, token: token);

        await prefsHelper.setisverify(true);

        yield CoderesultVendor(vendorInfo);
      } else {
        prefsHelper.setisverify(false);
        print("error");
        yield VerifyError(vendorInfo.message);
      }
    }
    if (event is CheckCodeCustomer) {
      print(event.code);
      print(event.mobile);
      yield Loading();
      if (event.isvendor == false) print("from customer");
      customerInfo = await helper.checksmscodecustomer(
          code: event.code, mobile: event.mobile);
      print("here the customer response");
      print(customerInfo);

      prefsHelper.setisverify(false);

      if (customerInfo != null) {
        await prefsHelper.setusername(customerInfo.fullName);
        await prefsHelper.setemail(customerInfo.email);
        await prefsHelper.setcustomerid(customerInfo.id);
        await prefsHelper.setislogin(true);
        await prefsHelper.setisverify(true);
        String token = await prefsHelper.gettoken();
        await helper.savetokenforcustomer(id: customerInfo.id, token: token);
        print(token);
        yield Coderesult(customerInfo);
      } else {
        prefsHelper.setisverify(false);
        yield VerifyError("wrong code");
      }
    }
  }
}
