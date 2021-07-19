part of 'vendormultireqestnotificationhandler_bloc.dart';

@immutable
abstract class VendormultireqestnotificationhandlerState {}

class VendormultireqestnotificationhandlerInitial
    extends VendormultireqestnotificationhandlerState {}

class GetRequestsState extends VendormultireqestnotificationhandlerState {
  final List<MultiReqestQModel> list;
  GetRequestsState(this.list);
}

class Loading extends VendormultireqestnotificationhandlerState {}

class Error extends VendormultireqestnotificationhandlerState {
  final String error;
  Error(this.error);
}
