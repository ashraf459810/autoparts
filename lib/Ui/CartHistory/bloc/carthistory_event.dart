part of 'carthistory_bloc.dart';

@immutable
abstract class CarthistoryEvent {}

class GetCartHistoryEvent extends CarthistoryEvent {
  final int pages;
  final int size;
  GetCartHistoryEvent(this.pages, this.size);
}

class ReturnItemEvent extends CarthistoryEvent {
  final int itemid;
  final String reason;
  ReturnItemEvent(this.itemid, this.reason);
}

class ReturnOrdersEvent extends CarthistoryEvent {
  final int page;
  final int size;
  ReturnOrdersEvent(this.page, this.size);
}
