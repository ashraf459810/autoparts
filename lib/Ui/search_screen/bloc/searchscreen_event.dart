part of 'searchscreen_bloc.dart';

@immutable
abstract class SearchscreenEvent {}

class Isvendor extends SearchscreenEvent {}

class GetBrandsEvent extends SearchscreenEvent {}

class GetcarsEvent extends SearchscreenEvent {
  final int id;
  GetcarsEvent(this.id);
}

class SearchProduct extends SearchscreenEvent {
  @nullable
  final String name;
  final int brand;
  final int car;
  // final String year;
  final int lowprice;
  final int highprice;
  final int pages;
  final int size;
  
  SearchProduct(
      {this.brand,
      this.car,
      this.highprice,
      this.lowprice,
      this.name,
      this.pages,
      this.size,
      // this.year
      });
}
