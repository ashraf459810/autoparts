part of 'wallet_bloc.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class GetPointsState extends WalletState {
  final String points;
  GetPointsState(this.points);
}

class Loading extends WalletState {}

class Error extends WalletState {
  final String error;
  Error(this.error);
}
