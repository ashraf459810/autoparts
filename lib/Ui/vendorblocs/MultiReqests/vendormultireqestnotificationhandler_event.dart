part of 'vendormultireqestnotificationhandler_bloc.dart';

@immutable
abstract class VendormultireqestnotificationhandlerEvent {}

class GetRequestsEvent extends VendormultireqestnotificationhandlerEvent {
  final int requestid;
  GetRequestsEvent(this.requestid);
}
