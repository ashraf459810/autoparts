import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:autopart/model/VendorChosenNotification/VendorChosenNotification.dart';
part 'chosennotifications_event.dart';
part 'chosennotifications_state.dart';

class ChosennotificationsBloc
    extends Bloc<ChosennotificationsEvent, ChosennotificationsState> {
  ChosennotificationsBloc() : super(ChosennotificationsInitial());
  PrefsHelper prefsHelper = PrefsHelper();
  List<Notifications> list = [];
  List<Notifications> notifications = [];
  HttpHelper helper = HttpHelper();

  @override
  Stream<ChosennotificationsState> mapEventToState(
    ChosennotificationsEvent event,
  ) async* {
    if (event is GetNotificationsEvent) {
      // yield Loading();
      print("here from the bloc ");
      int id = await prefsHelper.getvendorid();
      list = await helper.getontificationswithtype(
          id, event.pages, event.ssize, event.status);
      print("here thelist$list");
      if (list != null) {
        if (list.isNotEmpty) {
          print(list.length);
          print(notifications.length);
          if (notifications.length < list.length) {
            for (var i = 0; i < list.length; i++) {
              notifications.add(list[i]);
            }
          }
        } else {}
        yield ChosenNotificationState(notifications);
      } else
        yield Error("Error while Loading Notificatons");
    }
  }
}
