import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/BrandsEdit.dart';
import 'package:autopart/model/BrandsEditBody.dart';
import 'package:autopart/model/FinishedOrdersCustomer.dart';

import 'package:autopart/model/VendorInfoAfterVerify/VendorBrands.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profilebloc_event.dart';
part 'profilebloc_state.dart';

class ProfileblocBloc extends Bloc<ProfileblocEvent, ProfileblocState> {
  PrefsHelper prefsHelper = PrefsHelper();
  String email;
  String username;
  HttpHelper helper = HttpHelper();

  bool isvendor;
  ProfileblocBloc() : super(ProfileblocInitial());

  @override
  Stream<ProfileblocState> mapEventToState(
    ProfileblocEvent event,
  ) async* {
    if (event is Getisvendor) {
      yield Loading();
      int check = await prefsHelper.getvendorid();
      email = await prefsHelper.getemail();
      username = await prefsHelper.getusername();
      print(username);
      print("check" "$check");
      if (check != null) {
        isvendor = true;
      } else
        isvendor = false;
    }
    print(isvendor);
    yield ISvendor(isvendor, email, username);

    if (event is RateEvent) {
      yield Loading();
      if (event.isvendor == true) {
        int vendorid = await prefsHelper.getvendorid();
        String result = await helper.rateappforvendor(
            vendorid, "Vendor", event.rate, event.notes);
        if (result == "Done") {
          yield RateState(result);
        } else {
          yield Error("Error While Adding your Review");
        }
      } else {
        int customerid = await prefsHelper.getcustomerid();
        String result = await helper.rateappforcustomer(
            customerid, "Customer", event.rate, event.notes);
        if (result == "Done") {
          yield RateState(result);
        } else {
          yield Error("Error While Adding your Review");
        }
      }
    }
    if (event is SupportEvent) {
      yield Loading();
      if (event.isvendor == true) {
        int id = await prefsHelper.getvendorid();

        String message = await helper.support(id, "Vendor", event.notes);
        if (message != null) {
          yield SupportState(message);
        } else {
          yield Error("Error while sending your problem ");
        }
      } else {
        int id = await prefsHelper.getcustomerid();
        String message = await helper.support(id, "Customer", event.notes);
        if (message != null) {
          yield SupportState(message);
        } else {
          yield Error("Error while sending your problem ");
        }
      }
    }
    if (event is SuggestionEvent) {
      yield Loading();
      if (event.isvendor == true) {
        int id = await prefsHelper.getvendorid();
        String result = await helper.suggestion(id, "Vendor", event.notes);
        if (result != null) {
          yield SuggetsionState(result);
        } else {
          yield Error("There is error while sending suffestion");
        }
      } else {
        int id = await prefsHelper.getcustomerid();
        String result = await helper.suggestion(id, "Customer", event.notes);
        if (result != null) {
          yield SuggetsionState(result);
        } else {
          yield Error("There is error while sending suffestion");
        }
      }
    }
    if (event is GetVendorBrands) {
      yield Loading();
      String brands = await prefsHelper.getvendorbrands();
      final List<VendorBrands> decodedbrands = VendorBrands.decode(brands);
      print("here from state");
      print(decodedbrands);
      yield GetVendorBrandsState(decodedbrands);
    }
    if (event is EditBrandsEvent) {
      print("here from brands");
      yield Loading();
      BrandsEdit brandsEdit = await helper.editbrands(event.brandsEditBody);
      if (brandsEdit != null)
        yield EditBrandsState(brandsEdit);
      else
        yield Error("error while editing brands");
    }
    if (event is CustomerFinishedOrdersEvent) {
      yield Loading();
      int customerid = await prefsHelper.getcustomerid();
      List<FinishedOrders> list =
          await helper.customerfinishedorders(customerid, "DONE");

      if (list != null) {
        yield CustomerFinishedOrdersState(list);
      } else
        yield Error("some thing went wrong");
    }
    if (event is CustomerPendingOrdersEvent) {
      yield Loading();
      int customerid = await prefsHelper.getcustomerid();
      var list = await helper.customerfinishedorders(customerid, "PENDING");

      if (list != null) {
        yield PendingOrdersState(list);
      } else
        yield Error("some thing went wrong");
    }
  }
}
