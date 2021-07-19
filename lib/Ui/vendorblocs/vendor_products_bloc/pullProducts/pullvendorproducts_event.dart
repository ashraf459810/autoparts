part of 'pullvendorproducts_bloc.dart';

@immutable
abstract class PullvendorproductsEvent {}

// ignore: must_be_immutable
class Pullten extends PullvendorproductsEvent {
  int size;
  int page;
  String type;

  Pullten(this.page, this.size,this.type);
}
