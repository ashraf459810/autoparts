import 'dart:async';

import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/VendorStatistics.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vendorstatistics_event.dart';
part 'vendorstatistics_state.dart';

class VendorstatisticsBloc
    extends Bloc<VendorstatisticsEvent, VendorstatisticsState> {
  VendorstatisticsBloc() : super(VendorstatisticsInitial());
  VendorStatisics vendorStatisics;
  HttpHelper helper = HttpHelper();
  PrefsHelper prefsHelper = PrefsHelper();

  @override
  Stream<VendorstatisticsState> mapEventToState(
    VendorstatisticsEvent event,
  ) async* {
    if (event is GetVendorStatisticsEvent) {
      yield Loading();
      int id = await prefsHelper.getvendorid();

      vendorStatisics = await helper.getvendorstatistics(
        event.date1,
        event.date2,
        id
      );
      if (vendorStatisics != null) {
        yield GetStatisticsState(vendorStatisics);
      } else {
        yield Error("Error while getting statistics");
      }
    }
  }
}
