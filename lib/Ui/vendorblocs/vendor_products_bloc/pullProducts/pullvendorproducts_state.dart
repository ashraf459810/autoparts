part of 'pullvendorproducts_bloc.dart';

@immutable
abstract class PullvendorproductsState {}

class PullvendorproductsInitial extends PullvendorproductsState {}

// ignore: must_be_immutable
class GetVendorProductsState extends PullvendorproductsState {
  List<Content> content;

  GetVendorProductsState(this.content);
}

class GetNextPage extends PullvendorproductsState {
  GetNextPage();
}
