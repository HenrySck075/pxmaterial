import 'package:dart_eval/dart_eval.dart' as dart_eval;
import 'package:dart_eval/stdlib/core.dart';

/// what the fuck am i doing
dynamic eval(Object object, String property) => dart_eval.eval("dynamic m(Object obj)=>obj.$property;",function: "m", args: [$Object(object)]);

base class BaseJSON {
  dynamic operator [](String key)=>eval(this, key);
  /// if constructor throws error
  //BaseJSON tryConstruct(BaseJSON Function(Map<String, dynamic>) likeiknowwhatiamdoing) {}
}
