part of 'carthistory_bloc.dart';

@immutable
abstract class CarthistoryEvent {}

class GetCartHistoryEvent extends CarthistoryEvent {
  final int pages;
  final int size;
  GetCartHistoryEvent(this.pages, this.size);
}
