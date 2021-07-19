import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'getlocation_event.dart';
part 'getlocation_state.dart';

class GetlocationBloc extends Bloc<GetlocationEvent, GetlocationState> {
  GetlocationBloc() : super(GetlocationInitial());
  Position position;
  LatLng uae = LatLng(24.287254689319106, 54.47582548244591);
  LatLng ksa = LatLng(24.715240301732987, 46.578648195825814);
  LatLng oman = LatLng(23.572289283708788, 58.208450119690475);
  LatLng qatar = LatLng(25.27388414936233, 51.28900766512466);
  String city;
  String street;
  String country;
  var info;

  @override
  Stream<GetlocationState> mapEventToState(
    GetlocationEvent event,
  ) async* {
    if (event is GetlocationEvent) {
      yield Loading();
      await Permission.location.isGranted;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // position = await functions.determinePosition();
      print("here the postion $position");
      if (position == null) {
        yield Error("There is a problem with gettin your location");
      } else {
        info = await getLocationAddress(position.latitude, position.longitude);
        country = info[0].country;

        city = info[0].administrativeArea;

        // print(info[1].name);
        // print(info[1].locality);
        street = info[0].street;
        print(info);

        yield LocationState(position, city, country, street);
      }
    }
    if (event is SelectLocationEvent) {
      // yield Loading();

      switch (event.city) {
        case "UAE":
          {
            yield SelectCityState(uae);
            break;
          }

        case "Oman":
          {
            yield SelectCityState(oman);
            break;
          }

        case "Saudi Arabia":
          {
            yield SelectCityState(ksa);
            break;
          }

        case "Qatar":
          {
            yield SelectCityState(qatar);
            break;
          }
      }
    }
  }

  Future<List<Placemark>> getLocationAddress(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }
}
