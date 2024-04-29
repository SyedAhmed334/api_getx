class Url {
  static final Url _singleton = Url._internal();

  factory Url() => _singleton;

  Url._internal();
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String products = '$baseUrl/products';
}
