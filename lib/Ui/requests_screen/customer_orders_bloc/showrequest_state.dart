part of 'showrequest_bloc.dart';

@immutable
abstract class ShowrequestState {}

class ShowrequestInitial extends ShowrequestState {}

// ignore: must_be_immutable
class LoadedRequests extends ShowrequestState {
   List<Content> list = [];

  LoadedRequests(this.list);
}
