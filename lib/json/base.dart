import 'package:dart_eval/dart_eval.dart' as dart_eval;
import 'package:dart_eval/stdlib/core.dart';

/// what the fuck am i doing
dynamic eval(Object object, String property) => dart_eval.eval("dynamic m(Object obj)=>obj.$property;",function: "m", args: [$Object(object)]);

/// i call empty list falsy because js said so (""==[] is true)
bool checkFalsy(dynamic object) {
  return (object is int && object==0) || (object is String && object=="") || (object is List && object.isEmpty) || (object==null);
}
