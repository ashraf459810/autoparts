import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial());
  PrefsHelper prefsHelper = PrefsHelper();
  HttpHelper helper = HttpHelper();

  @override
  Stream<WalletState> mapEventToState(
    WalletEvent event,
  ) async* {
    if (event is GetPointsEvnt) {
      yield Loading();
      int id = await prefsHelper.getcustomerid();
      print(id);
      String points = await helper.getcustomerpoints(id);
      if (points != null) {
        yield GetPointsState(points);
      } else
        yield Error("Error while gettin your points");
    }
  }
}
