part of 'checkcode_bloc.dart';

@immutable
abstract class CheckcodeEvent {}

// ignore: must_be_immutable
class Codecheck extends CheckcodeEvent {
  String mobile;
  String code;
  bool isvendor;

  Codecheck(this.mobile, this.code,this.isvendor);
}

// ignore: must_be_immutable
class CheckCodeCustomer extends CheckcodeEvent {
  String mobile;
  String code;
  bool isvendor;

  CheckCodeCustomer(this.mobile, this.code,this.isvendor);

}
