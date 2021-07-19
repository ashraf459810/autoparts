part of 'profilebloc_bloc.dart';

@immutable
abstract class ProfileblocEvent {}

class Getisvendor extends ProfileblocEvent {
  Getisvendor();
}
class GetVendorBrands extends ProfileblocEvent {}

class RateEvent extends ProfileblocEvent {
  final int rate;
  final String notes;
  final String ratertype;
  final bool isvendor;
  RateEvent({this.notes, this.rate, this.ratertype, this.isvendor});
}

class SupportEvent extends ProfileblocEvent {
  final bool isvendor;
  final String notes;
  SupportEvent(this.isvendor, this.notes);
}

class SuggestionEvent extends ProfileblocEvent {
  
  final String notes;
  final bool isvendor;
  SuggestionEvent(this.isvendor, this.notes, );
}
 class EditBrandsEvent extends ProfileblocEvent{
     final BrandsEditBody brandsEditBody;
  EditBrandsEvent(this.brandsEditBody);

 }