// "Empty list is null!" -some pixiv devs

T? ifNullfies<T>(dynamic testObj) => testObj is List?null:testObj as T;
