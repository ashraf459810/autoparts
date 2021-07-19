import 'dart:async';

import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  LoginblocBloc() : super(LoginblocInitial());
  PrefsHelper prefsHelper = PrefsHelper();
  int number = 0;

  @override
  Stream<LoginblocState> mapEventToState(
    LoginblocEvent event,
  ) async* {
    if (event is Islogin) {
      bool s = await prefsHelper.getislogin();
      print("$s" "is login");
      if (s == true) {
        int ss = await prefsHelper.getvendorid();
        print("$ss" "is vendor");
        if (ss != null) {
          yield Isloginstate(true, true);
        } else {
          yield Isloginstate(true, false);
        }
      } else {
        yield Isloginstate(false, false);
      }
    }
    if (event is Addnotifications) {
      print("event is add notification");
      number++;
      yield GetNotifications(number);
      print("state yielded from bloc ");
    }

    if (event is ZeroNotification) {
      yield GetNotifications(0);
    }
     if (event is AddnotificationsCustomer) {
      print("event is add notification");
      number++;
      yield GetNotificationsCustomer(number);
      print("state yielded from bloc ");
    }

     if (event is ZeroNotificationCustomer) {
      yield GetNotificationsCustomer(0);
    }
    
  }
}
