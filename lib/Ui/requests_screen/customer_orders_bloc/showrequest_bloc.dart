import 'dart:async';


import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/customeOrdersResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'showrequest_event.dart';
part 'showrequest_state.dart';

class ShowrequestBloc extends Bloc<ShowrequestEvent, ShowrequestState> {
  List<Content> list = [];

  ShowrequestBloc() : super(ShowrequestInitial());
  PrefsHelper helper = PrefsHelper();
  HttpHelper httpHelper = HttpHelper();

  @override
  Stream<ShowrequestState> mapEventToState(
    ShowrequestEvent event,
  ) async* {
    if (event is LoadRequest) {
      print(list);
      int s = await helper.getcustomerid();
      list = await httpHelper.customerorders(
          id: s, pages: event.page, size: event.size);
      yield (LoadedRequests(list));
    }
  }
}
