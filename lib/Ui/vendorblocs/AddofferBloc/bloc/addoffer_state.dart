part of 'addoffer_bloc.dart';

@immutable
abstract class AddofferState {}

class AddofferInitial extends AddofferState {}

// ignore: must_be_immutable
class AddOfferState extends AddofferState {
  String result;

  AddOfferState({this.result});
}

// ignore: must_be_immutable
class AddOfferErrorState extends AddofferState {
  String result;

  AddOfferErrorState({this.result});
}

