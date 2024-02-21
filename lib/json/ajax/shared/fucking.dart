// "Empty list is null!" -some pixiv devs

T? ifNullfies<T>(dynamic testObj) => testObj is List?null:testObj as T;
Map<String,dynamic> nullfiesEmptyArrays(Map<String, dynamic> obj) {
  Map<String,dynamic> newOne = {};
  var riceCooker = obj.entries.iterator;

  while (riceCooker.moveNext()) {
    newOne[riceCooker.current.key] = riceCooker.current.value is Map?nullfiesEmptyArrays(riceCooker.current.value):ifNullfies(riceCooker.current.value);
  }
  return newOne;
}
