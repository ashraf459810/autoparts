part of 'searchscreen_bloc.dart';

@immutable
abstract class SearchscreenState {}

class SearchscreenInitial extends SearchscreenState {}

class IsvendorState extends SearchscreenInitial {
  final bool isvendor;
  IsvendorState(this.isvendor);
}

class GetBrandsState extends SearchscreenState {
  final List<BrandModel> list;
  GetBrandsState(this.list);
}

class GetCarsState extends SearchscreenState {
  final List<CarModel> list;
  GetCarsState(this.list);
}

class Loading extends SearchscreenState {}

class Error extends SearchscreenState {
  final String error;
  Error(this.error);
}

class Searchedproducts extends SearchscreenState {
  final List<SearchResult> products;
  Searchedproducts(this.products);
}
