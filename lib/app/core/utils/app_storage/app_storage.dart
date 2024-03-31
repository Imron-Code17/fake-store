import 'dart:convert';
import 'package:fakestore/app/features/auth/data/models/login_response.dart';
import 'package:fakestore/app/features/auth/domain/entities/login_entity.dart';
import 'package:fakestore/app/features/cart/domain/entities/cart_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/product/presentation/utils/models/cart_product_body.dart';

class AppStorage {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _authToken = 'auth_token';
  final String _favorite = 'favorite';
  final String _cartProduct = 'cart_product';

  Future<void> saveAuthToken({LoginEntity? data}) async {
    String authToken = json.encode(data?.toJson());
    await _prefs?.setString(_authToken, authToken);
  }

  Future<LoginEntity?> getAuthToken() async {
    final data = _prefs?.getString(_authToken);
    if (data != null) {
      final dataModel = LoginResponse.fromJson(json.decode(data));
      return LoginEntity.fromModel(dataModel);
    }
    return null;
  }

  //<---------------------------(Start Product Favorite)--------------------------->//

  Future<void> saveFavorite({required int id}) async {
    List<String>? favorites = _prefs?.getStringList(_favorite) ?? [];
    favorites.add(id.toString());
    await _prefs?.setStringList(_favorite, favorites);
  }

  List<int> getFavorites() {
    List<String>? favorites = _prefs?.getStringList(_favorite) ?? [];
    return favorites.map((id) => int.parse(id)).toList();
  }

  Future<void> removeFavorite({required int id}) async {
    List<String>? favorites = _prefs?.getStringList(_favorite) ?? [];
    favorites.remove(id.toString());
    await _prefs?.setStringList(_favorite, favorites);
  }

  bool isFavorite({required int id}) {
    List<String>? favorites = _prefs?.getStringList(_favorite) ?? [];
    return favorites.contains(id.toString());
  }

  //<---------------------------(End Product Favorite)--------------------------->//

  //<---------------------------(Start Cart Product)--------------------------->//

  void saveCartProduct({required CartBody data}) async {
    var dataEntity = CartEntity(
      id: data.id,
      title: data.title,
      price: data.price,
      image: data.image,
      qty: data.qty,
    );

    List<CartEntity> cartProducts = getCartProducts();

    bool productExists = false;
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts[i].id == dataEntity.id) {
        cartProducts[i] =
            cartProducts[i].copyWith(qty: (cartProducts[i].qty ?? 0) + 1);

        productExists = true;
        break;
      }
    }
    if (!productExists) {
      cartProducts.add(dataEntity);
    }
    await _saveCartProducts(cartProducts);
  }

  void updateQuantity({required int id, required int newQuantity}) async {
    List<CartEntity> cartProducts = getCartProducts();
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts[i].id == id) {
        cartProducts[i] = cartProducts[i].copyWith(qty: newQuantity);
        break;
      }
    }
    await _saveCartProducts(cartProducts);
  }

  void deleteCartProduct({required int id}) async {
    List<CartEntity> cartProducts = getCartProducts();
    cartProducts.removeWhere((product) => product.id == id);
    await _saveCartProducts(cartProducts);
  }

  void deleteAllCartProduct() async {
    List<CartEntity> cartProducts = getCartProducts();
    cartProducts.clear();
    await _saveCartProducts(cartProducts);
  }

  List<CartEntity> getCartProducts() {
    final List<String>? cartProductStrings =
        _prefs?.getStringList(_cartProduct);
    final List<CartEntity> cartEntities = cartProductStrings
            ?.map((jsonString) => CartEntity.fromJson(json.decode(jsonString)))
            .toList() ??
        [];
    return cartEntities;
  }

  Future<void> _saveCartProducts(List<CartEntity> cartProducts) async {
    final List<String> cartProductStrings = cartProducts
        .map((cartEntity) => json.encode(cartEntity.toJson()))
        .toList();
    await _prefs?.setStringList(_cartProduct, cartProductStrings);
  }

  //<---------------------------(End Cart Product)--------------------------->//

  Future<void> clearAuthToken() async {
    await _prefs?.remove(_authToken);
  }
}
