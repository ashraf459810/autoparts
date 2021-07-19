library serializer;
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';


part 'serializer.g.dart';

@SerializersFor(const [

])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())

)
    .build();
