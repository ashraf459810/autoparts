library app_state;


import 'package:built_value/built_value.dart';


part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  // fields go here

  bool get loginState;
  int get appLanguage;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initail() {
    return AppState((b) => b..loginState = false..appLanguage = 0);
  }
}
