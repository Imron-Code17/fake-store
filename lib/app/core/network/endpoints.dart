class Endpoints {
  // Auth
  static const String login = 'auth/login';

  // product
  static const String products = 'products';
  // category
  static const String categories = 'products/categories';
  static const String productsByCategories = 'products/category';

  static const Duration connectTimeout = Duration(milliseconds: 15000);
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
}
