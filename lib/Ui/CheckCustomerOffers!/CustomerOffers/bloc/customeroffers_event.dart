part of 'customeroffers_bloc.dart';

@immutable
abstract class CustomeroffersEvent {}

class GetOfferEvent extends CustomeroffersEvent {
  final int size;
  final int pages;
  final int requestid;
  GetOfferEvent(this.pages, this.size,this.requestid);
}
