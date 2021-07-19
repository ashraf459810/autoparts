part of 'getlocation_bloc.dart';

@immutable
abstract class GetlocationEvent {}

class LocationEvent extends GetlocationEvent {}

class SelectLocationEvent extends GetlocationEvent {
  final String city;
  SelectLocationEvent(this.city);
}
