class Placeholder {
  Placeholder();
  @override
  dynamic noSuchMethod(Invocation inv) {
    return null;
  }

  factory Placeholder.fromJson(dynamic json) => Placeholder();
}
