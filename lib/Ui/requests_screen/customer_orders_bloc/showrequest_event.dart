part of 'showrequest_bloc.dart';

@immutable
abstract class ShowrequestEvent {}

// ignore: must_be_immutable
class LoadRequest extends ShowrequestEvent {
  int size;
  int page;
  LoadRequest(this.page, this.size);
}
