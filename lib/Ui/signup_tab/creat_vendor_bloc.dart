import 'dart:async';


import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/vendor%20sign%20up%20model/vendor_sign_up.dart';
import 'package:autopart/model/vendorresponse/vendorResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'creat_vendor_event.dart';
part 'creat_vendor_state.dart';

class CreatVendorBloc extends Bloc<CreatVendorEvent, CreatVendorState> {
  HttpHelper iHttpHelper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();
  CreatVendorBloc() : super(CreatVendorInitial());

  @override
  Stream<CreatVendorState> mapEventToState(
    CreatVendorEvent event,
  ) async* {
    if (event is CreateVendor) {
      yield Loading();
      Vendoresponse vendoresponse =
          await iHttpHelper.createvendor(createVendor: event.createVendorModel);

      if (vendoresponse.message != null) {
        yield Vendroerror(vendoresponse.message);
      }
      if (vendoresponse.message == null) {
        print('vendor create response' + "${vendoresponse.id}");
        await prefsHelper.setvendorid(vendoresponse.id);

        // await prefsHelper.setislogin(true);
        // String token = await prefsHelper.gettoken();
        // await iHttpHelper.savetokenforvendor(
        //     id: vendoresponse.id, token: token);
        // print(token);
        yield CreateVendorSuccess(vendoresponse);
      } 
    }
    if (event is Listbrands) {
      print("here from event");
      List<BrandModel> brands = await iHttpHelper.getbrandd();
      print("here after http");
      print(brands);
      if (brands != null) print(brands);
      yield BrandState(brands);
    }
  }
}
