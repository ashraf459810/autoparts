library app_event;


import 'package:built_value/built_value.dart';


part 'app_event.g.dart';

abstract class AppEvent {}

abstract class IniEvent extends AppEvent
    implements Built<IniEvent, IniEventBuilder> {
  // fields go here

  IniEvent._();

  factory IniEvent([updates(IniEventBuilder b)]) = _$IniEvent;
}
