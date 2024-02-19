// "Empty list is null!" -some pixiv devs

T? ifNullfies<T>(dynamic testObj) => testObj is List?null:testObj as T;
T nullfiesEmptyArrays<T extends Map>(T obj) {
  T newOne = {} as T;
  var riceCooker = obj.entries.iterator;

  while (riceCooker.moveNext()) {
    newOne[riceCooker.current.key] = riceCooker.current.value is Map?nullfiesEmptyArrays<Map<String,dynamic>>(riceCooker.current.value):riceCooker.current.value;
  }
  return newOne;
}
