part of 'customeroffers_bloc.dart';

@immutable
abstract class CustomeroffersState {}

class CustomeroffersInitial extends CustomeroffersState {}

class Loading extends CustomeroffersState {}

class OnError extends CustomeroffersState {
  final String message;
  OnError(this.message);
}

class GetOffersState extends CustomeroffersState {
  final List<Offer> offers;
  GetOffersState(this.offers);
}
