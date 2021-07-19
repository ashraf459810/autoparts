part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocState {}

class LoginblocInitial extends LoginblocState {}

// ignore: must_be_immutable
class Isloginstate extends LoginblocState {
  bool login;
  bool isvendor;
  Isloginstate(this.login, this.isvendor);
}

class GetNotifications extends LoginblocState {
  final int number;
  GetNotifications(this.number);
}

class GetNotificationsCustomer extends LoginblocState {
  final int number;
  GetNotificationsCustomer(this.number);
}
